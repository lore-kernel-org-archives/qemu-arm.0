Received: by 10.25.159.19 with SMTP id i19csp510336lfe;
        Fri, 15 Jan 2016 06:50:44 -0800 (PST)
X-Received: by 10.31.8.194 with SMTP id 185mr7526816vki.12.1452869444470;
        Fri, 15 Jan 2016 06:50:44 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x234.google.com (mail-vk0-x234.google.com. [2607:f8b0:400c:c05::234])
        by mx.google.com with ESMTPS id o133si11184414vkd.25.2016.01.15.06.50.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Jan 2016 06:50:44 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::234 as permitted sender) client-ip=2607:f8b0:400c:c05::234;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::234 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x234.google.com with SMTP id n1so145001813vkb.3
        for <alex.bennee@linaro.org>; Fri, 15 Jan 2016 06:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=N6SJW/Qe8V1nSHMYmrZn3CZLqmxM5A+tSD150azPIZw=;
        b=JzY8DpMmTDJRS78+9vqxjDhN7klUu88BWpocT6XGHMCxMKlq17IE3p/bauSUqYAsqc
         Ma+bZQGdyy8teD4ue32Xtp1zd2fIO9i1TzQB5XcgHE1CxH8G0ANEv0lp20LJ6lfuCvjJ
         yCH+4gyL968jSsXqIfZMbTNjj8aOtX+GVVmcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=N6SJW/Qe8V1nSHMYmrZn3CZLqmxM5A+tSD150azPIZw=;
        b=iYAmxZFPLmSbEkS+ZIlZO01CLUwDtSFOxs5jMoBAMc3dBJJpDPDSLv1AflNFqPLVcM
         P50jxK8xo2jWZ/lJJqnVbsGUalQN4P0N9F6a8mf44yE7QaqLikXv/cqDEZ740WmqxFt6
         0O+qV2rTgBoMvnr1rNUixfNlqsdsN5DoKSgUXtDOP7+cUvAcvzSxukamhmNZqEStZZRP
         eDcxvtgOXJS8rFWASUDr/4Kjt0Fa8s73ZlETzeC00T9cVBHysfcexIqEbpjB6YHcbnbT
         UK3YqsxMUYwDN3ZDWGLlszsUhIO18hQNbv5GXyfzhQCMfKk36liqhD2GsLdzfkCZhaPx
         msFA==
X-Gm-Message-State: ALoCoQk/tAEArBVDq0gnlDv68EIEBcgS5b7e4zHBpd+DElDx/qjE7NLRdGZVSHERyKBWP05VMTR/crGGCnvxiojD/UJ7VkpqG5CCbAR+b03JMKurlpIWlx8=
X-Received: by 10.31.180.145 with SMTP id d139mr6827128vkf.83.1452869444122;
 Fri, 15 Jan 2016 06:50:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 15 Jan 2016 06:50:24 -0800 (PST)
In-Reply-To: <20160115143836.GI29396@toto>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-2-git-send-email-peter.maydell@linaro.org> <20160115143836.GI29396@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2016 14:50:24 +0000
Message-ID: <CAFEAcA_GkZNcXTHLN_rb1Tdi=sUSgxK07abZsOu59Ogbx-uqGQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] target-arm: Properly support EL2 and EL3 in arm_el_is_aa64()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: U11kM+5tjlRw

On 15 January 2016 at 14:38, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> On Thu, Jan 14, 2016 at 06:34:04PM +0000, Peter Maydell wrote:
>> Support EL2 and EL3 in arm_el_is_aa64() by implementing the
>> logic for checking the SCR_EL3 and HCR_EL2 register-width bits
>> as appropriate to determine the register width of lower exception
>> levels.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Hi Peter,
>
> On the ZynqMP we've got the Cortex-A53 EL3 RW configurable at reset
> time. At some later point we'll likely have to implement that
> runtime option...

That might be tricky, we fairly well bake in "AARCH64 feature means
64-bit highest EL" at the moment. The KVM code takes the approach
of "if it's not going to reset in AArch64 then unset the feature bit".

Anyway, we'll cross that bridge when we get to it.

Do you have much locally extra that you needed for enabling
EL3 in the Cortex-A53? I have an ARM Trusted Firmware + OP-TEE
setup now that I'm going to use to work through the missing bits,
but if you've already gone through that effort there's no need
my duplicating work...

thanks
-- PMM

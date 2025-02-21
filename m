Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp320617njc;
        Fri, 21 Feb 2025 06:26:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWF+zH6N9U3Se58JnbJWTx2VmEE4QD4XtChd8zNNV9D4yiok/Pvq5kCvjYsRXD6VlmeakeTd9+n97uxYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGQ+LzXtlDbMZEEzeFtf7J815wai+lt5hAjnrJEZv96FaxCKV6lrm6j0UWxT0G9i+kQ/wmX
X-Received: by 2002:a05:620a:2699:b0:7c0:c0d7:5808 with SMTP id af79cd13be357-7c0ceefa062mr440998185a.23.1740147986061;
        Fri, 21 Feb 2025 06:26:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740147986; cv=none;
        d=google.com; s=arc-20240605;
        b=U4+nfuolJjiObsVi0sfbRwp2U7eJxBN6FaPYXqVPm3WdeFYry8D2+9k2U9XVXNyH9/
         RXhNsMva44dqXQMTRkpScG1AzqkUE2XgqXE9YLr1pDybUN15glzrc/80hrHaP3KYcSmm
         MEJRdQsxcTUqWf21a/3+z3/VhntcsSo1rilmiAR15Jtwk9F+axIsAL6SAPBAmPw4ranH
         mn+mSEOQNM/uCJTDZcd4TtlNe0pJ0ZntAekmsTpg/NFhPmjBAiT0Fdhb6B+1MUHPe+8Q
         7JsqOZaZ7bIxs0E/Qsv+q+1y1UuhYfZAp/1HxYkDDR6+YUknWuFxeaWAs5nm2hoyc4ls
         BS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:cc:from:references:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=vcaHqrRRq6tcYLUiQcJufhAfxjn15bqIY3uspjlXzIc=;
        fh=e6sLOivk5H2iLmpwHyh1rgTxTDpEtdSSEGOp1W4Gtu0=;
        b=fc+yBU3ZTUqXPAeZTS10e48KNZd5lydcZXyOLTFp96WSYV79wVMKkhPweNNC/1jh4f
         slo6X0mmAk9r0KuikZa3mT4XPFXQZi68Rhj/djbuoW2zxIUQC+1/0OV+pBotSYOx/2gw
         SR9cXW5imaBL7z6neNJIhbq13S4fhhhFllPI/I3DT1y9AhNomxTiAa8vhJNiG0sP+yVZ
         5hARGHt6jwuftgfWRf+0fR1i1xf+8rjQoR6DSEmltDniiFTG1dec9nSDF3Fb9Ciq9ff+
         xGQ2A884+DCUroCf6LxCqHEURmZ5ZpJNAf9TBUl6Cpr476HcRq+yXpCY2D9J6vNT6nT0
         kTtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c5xWJkos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0a820e664si774958385a.161.2025.02.21.06.26.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2025 06:26:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c5xWJkos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tlTyL-0006JW-PF; Fri, 21 Feb 2025 09:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tlTy7-0006Hv-NQ
 for qemu-arm@nongnu.org; Fri, 21 Feb 2025 09:25:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tlTy6-0000I2-3W
 for qemu-arm@nongnu.org; Fri, 21 Feb 2025 09:25:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740147928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vcaHqrRRq6tcYLUiQcJufhAfxjn15bqIY3uspjlXzIc=;
 b=c5xWJkoslM8Cz3/6e1EjLf1NTP7sKVeauuBZQ7hwjLbeQSeSi289ZSVuFGFb0DRu6Bgo6A
 uaPBPV2HcvRKrcJGkqh95XPBuLe0vbvIJBGvpgwqzwaYC1yHOKuD0n5BwFsG2HopYkimH0
 1AM9JxE6IzpiQ3fN9laaNxbpdh8Yxzs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-F_FH_awCOfaj9SIx1tPo8A-1; Fri, 21 Feb 2025 09:25:25 -0500
X-MC-Unique: F_FH_awCOfaj9SIx1tPo8A-1
X-Mimecast-MFC-AGG-ID: F_FH_awCOfaj9SIx1tPo8A_1740147925
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4393e89e910so11760185e9.0
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2025 06:25:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740147925; x=1740752725;
 h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vcaHqrRRq6tcYLUiQcJufhAfxjn15bqIY3uspjlXzIc=;
 b=gJKlTVGNo73sGwnM5kL+EUTahdpHOT6i+plWgc3JVWxalYP6D39AVSh89JBnPH2toV
 Z7IFze9qJfiXx3y4ZPp4JS+LOIHUWUGDj30rl3opjEpoEGjECpnq/E+D2B/eH2wlC3Gl
 /luxuBQw6GIFkoe7cv2mRZTb2PT0mCVxRAZIMiywa178WyRUrS1nrmpP6Elu+tbpAUce
 ta9QPaMLRw9bYIVARFfTOvrghl6FTSSU2sKjb4RwlT5J1vLhEFWilVOSoHV2uk4yrlco
 dQUgHvzSQnIz0EYpWiEZwPxYnbN3qUa2yumkIUDlgfrUych0g+2nXRMEiQf0oIioq2dC
 m3xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxdDGh/md0zdUsHHH8O0xUpD2HarIt0pm5ec+cf9MyuKmw+r433h9Qo/akFTARjEvw9q/QWfD31Q==@nongnu.org
X-Gm-Message-State: AOJu0Yy01iCT9ziG0izqHq1SNN45ftcjre5oiD0lVj2sgiTwUe/yS8UA
 wvNst/IEukJf81FLVjtoBAniymxC1bvTfWy5AFZthgW1xgj+e9rJVQaUPK+JL3F0DeVWd3BJBDx
 fpx61f2hEgMF8kVuCcD+uYhFGsW/LOcf3h0nHwzS8+W7wVaEBCA==
X-Gm-Gg: ASbGncsLyOd07UPJhywIxFCP47Szj8pWMyO5nD3ktqEB+fqhmhzeHj98q3MmC0BPT8a
 vmT6sHI5hDR0bcGh+9Jgi7vumZrBiittvf48E5iVi/RUiIGbY0GPpPaB6UJrPUtPphLo0aL5rJM
 3UXIWZzG3EJWQ0mAjl3hOjt/G9UJoRbsLfcbP8xTpk0S63uhvNpuKdWWXDdyuHtQuMUjd8jpeKs
 QaALRSNb0Iu46gcMtdNwyUPgcipOPK9qIdFFx+fAYKyuIC4eLfkiFZuJnNZlgBZtLmAFrcxXtXF
 MlvMxT/0I/+mPyJ9r7tLNfekvP96hy0wDfZFsQamMPT3gGw=
X-Received: by 2002:a05:600c:1c1b:b0:439:942c:c1cd with SMTP id
 5b1f17b1804b1-439ae1f1991mr29895645e9.15.1740147924744; 
 Fri, 21 Feb 2025 06:25:24 -0800 (PST)
X-Received: by 2002:a05:600c:1c1b:b0:439:942c:c1cd with SMTP id
 5b1f17b1804b1-439ae1f1991mr29895455e9.15.1740147924344; 
 Fri, 21 Feb 2025 06:25:24 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-157.web.vodafone.de.
 [109.42.51.157]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b030bd9csm18788735e9.28.2025.02.21.06.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 06:25:23 -0800 (PST)
Message-ID: <12ff6477-7cd5-4ada-b7a8-97a3add814c3@redhat.com>
Date: Fri, 21 Feb 2025 15:25:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional: Bump some arm test timeouts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250221140640.786341-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250221140640.786341-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9aolKb9eKM0rzUqx8_d21OCFUzhbpF6L7wUUIRnasv8_1740147925
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.424,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HIGl4nr5EqGi

On 21/02/2025 15.06, Peter Maydell wrote:
> On my local machine, for a debug build, sbsaref_alpine takes
> nearly 900s:
> 
> $ (cd build/x86 && ./pyvenv/bin/meson test --setup thorough --suite func-thorough func-aarch64-aarch64_sbsaref_alpine
> )
> 
> 1/1 qemu:func-thorough+func-aarch64-thorough+thorough / func-aarch64-aarch64_sbsaref_alpine
>                        OK 896.90s
> 
> arm_aspeed_rainier can also run close to its current timeout:
>   6/44 qemu:func-thorough+func-arm-thorough+thorough / func-arm-arm_aspeed_rainier
>                        OK 215.75s
> 
> and arm_aspeed_ast2500 and arm_aspeed_ast2600 can go over:
> 13/44 qemu:func-thorough+func-arm-thorough+thorough / func-arm-arm_aspeed_ast2600
>                        OK 792.94s
> 
> 27/44 qemu:func-thorough+func-arm-thorough+thorough / func-arm-arm_aspeed_ast2500
>                   TIMEOUT 480.01s
> 
> The sx1 test fails not on the overall meson timeout but on the
> 60 second timeout in some of the subtests.
> 
> Bump all these timeouts up a bit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This at least gets 'make -j4 check-functional' to passing for me
> for an arm/aarch64 debug build, apart from the gpu test hang which
> we're discussing in a different thread. Whole thing takes 25 mins...
> ---
>   tests/functional/meson.build     | 8 ++++----
>   tests/functional/test_arm_sx1.py | 6 +++---
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index b516d21cba1..effa31701cf 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -15,16 +15,16 @@ test_timeouts = {
>     'aarch64_raspi4' : 480,
>     'aarch64_rme_virt' : 1200,
>     'aarch64_rme_sbsaref' : 1200,
> -  'aarch64_sbsaref_alpine' : 720,
> +  'aarch64_sbsaref_alpine' : 1200,

I wonder whether we should disable that test with @skipSlowTest() by 
default, since it's really very slow...?

Anyway, for this patch here:
Reviewed-by: Thomas Huth <thuth@redhat.com>


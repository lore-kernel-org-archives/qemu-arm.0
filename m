Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2732505lfc;
        Sat, 5 Sep 2020 20:47:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhapx6cSxD2R/IXdDpCuk8hq2ubNMVScWN7PrbUck1b+7CvwvmV1wWJuI8KmS5TWXBLZ2B
X-Received: by 2002:a25:4904:: with SMTP id w4mr21882746yba.63.1599364075702;
        Sat, 05 Sep 2020 20:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599364075; cv=none;
        d=google.com; s=arc-20160816;
        b=Q05dFBIgp/aw1bGGMRClL26dHMSVtiM5bgqYWaVE5//E8XzuBDpsRnIekzlsTOiMbx
         o1f/yPM5ZcLo+JbU2s3lhYzvyNjBLOLVAw6FpwbynMOCQCd7ZiQmD+aFZsgYG3+bG0tv
         ULaA5t+PMGu8KeFBwPt0qJXjCTaYzRDhM6P8EEGq5eT61VrdYDTsMsD+zzXMRymmvwOV
         sOYG5k9xlbtJhTbR1LBlP4yDEvaPMESTtiBLZJRwdsJtnJ4IU9pAYfXwgkQ/hyK5K+f/
         P37X+UQLTDNIcosxJNhhfBoHkT5RgV8CS/QSueyFdVkbSB2/rkl2QJSB0atsNv+5hz3d
         2zyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=b5ZzcbJiwBJ+DcHp0jwy+RGUII9IoGUI9Y6vnQMR98E=;
        b=Y77pKHjbQjTkEkF2CUvzCY039fTaL8ms0p9nIVzIMUv7eJJAofwW2jKmZaVCEQa16c
         KQgkHCxhkRTFINEuwKlidRWjCkkCj+xdzKK/jDa9kp475Hn0OAvC6U49Ubs9Fw+DcmBG
         iS9mszkfA9qoWeM3fxKBuzhkA3Fp+7UMo+KGnMc+1Q0DiY5nsjj6AgcGybqjOc8mC5Fx
         VI65ZrAm+9kL4kbAB+xbJnCnzmqHVvTree11bNIer17xdUsPaPbxwc1evpftyz89XS7j
         mq5UDW2adMcl+W8pG4MU/9nDNx4LLCQuaF+ytZ64n1mYITBx1h8PMDsdoudPZCwhycT7
         BF/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fc6lHuNI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w192si9874695ybe.322.2020.09.05.20.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Sep 2020 20:47:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fc6lHuNI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kElek-0000Vq-34
	for alex.bennee@linaro.org; Sat, 05 Sep 2020 23:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEleb-0000UZ-AW
 for qemu-arm@nongnu.org; Sat, 05 Sep 2020 23:47:45 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEleZ-0003h4-Oh
 for qemu-arm@nongnu.org; Sat, 05 Sep 2020 23:47:45 -0400
Received: by mail-pg1-x541.google.com with SMTP id l191so6372090pgd.5
 for <qemu-arm@nongnu.org>; Sat, 05 Sep 2020 20:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b5ZzcbJiwBJ+DcHp0jwy+RGUII9IoGUI9Y6vnQMR98E=;
 b=Fc6lHuNIK77UgyYWFHT0rqV4kh+9p1Ad1BhQ3U1uHQv97ziBYqL2QaoF0pJe0lyQnx
 U17u5+ibFnNA1PJuhCjfF+RhT+SBl5zVg/SJCXCOunBSBSqAIfzEwywj671pAck3HYSd
 G4VvNXjOt0TaFnBbyjsfZaS/Th1jZBAE/bAasx6poV8xi8u/LMpZ0Y7+VkF7+nvFktNx
 DsxSVgLqxRyW5yWBlNGBoS468tUl1if7ZURBvzQiIHAytpOPwcWFIut4eBUHIfQ8oC+W
 zrczGEHENi2juzoosW9nDy2Pxz2I3DA2YL3vuVFwAF9OT2kEonxwnIRqn54mU2s/YblM
 aRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b5ZzcbJiwBJ+DcHp0jwy+RGUII9IoGUI9Y6vnQMR98E=;
 b=DnYxRPioGZyABYdBCk5QnBSShX6UaGb3fXmp+E2AV2tF6riD5ZY/68wb8m4gaynmvd
 DDHroX0dJggbUuVy72MHoVuG12OW+1+CuNRJU3RjzSkkJ7wNTM6XZ8uObFWho72htcbB
 ayyApZrH3Y6SbJW6/2MJyCwNVRmNJP2INjrL/Jutu+Ekq5IcJTI3PFgS1s6gCss3+3en
 9tO30vD27kY8FXAd7AFvSUoZHjXbWgbwY03Wa7tx7CCH7FWFhhtgQ0/UGana0aGpLWDh
 mvytAexUAGoH6KDuUrZlUQzxqxEGLlRFrnMNkEMEjQAohZ9o6Q+VijrzApym+Xhw6B7t
 P5PA==
X-Gm-Message-State: AOAM533VFggYUGOMvfrvaRgkVsmxMcH/SfPHrUrtUsItlv5n71gMZZds
 +PBZlturlUwiTCQDESnb2ATAHQ==
X-Received: by 2002:aa7:8f28:: with SMTP id y8mr2476963pfr.180.1599364062241; 
 Sat, 05 Sep 2020 20:47:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a20sm9956366pfa.59.2020.09.05.20.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 20:47:41 -0700 (PDT)
Subject: Re: [PATCH 03/13] dma: Document
 address_space_map/address_space_unmap() prototypes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
 <20200904154439.643272-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40969041-60e7-c132-b414-0feb57ca07fe@linaro.org>
Date: Sat, 5 Sep 2020 20:47:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904154439.643272-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: InAf1tZYADTJ

On 9/4/20 8:44 AM, Philippe Mathieu-Daudé wrote:
> Add documentation based on address_space_map / address_space_unmap.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/sysemu/dma.h | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5281015ejc;
        Mon, 6 Mar 2023 16:30:44 -0800 (PST)
X-Google-Smtp-Source: AK7set9L5OhCMhSbm2LejmC92pehJ9/hGzuxyNbXaYwkbHHBMcCO2EOUbgaqdE+1tvdqPomps7tq
X-Received: by 2002:a05:6214:da4:b0:535:5492:b427 with SMTP id h4-20020a0562140da400b005355492b427mr23548157qvh.28.1678149044798;
        Mon, 06 Mar 2023 16:30:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678149044; cv=none;
        d=google.com; s=arc-20160816;
        b=cylyzK+0Z3f314cu4hrrzJ2B+/xYwicTzuCgTMWf1Cro/s0e8NNTMbewscm1Ss1B0b
         y8odbnkcIhB9DRwhqr8CmFPiwqMBimIWI8Dqk94t6budtri0NZV+1wXOdz8KIWzg1Tm7
         BUPtIreuenwRhhufz/dSQhmRKzprGEPupjlrS6OWXimSvXB7dBbevaDE+uYA3LLC54og
         SoFgvtbdNZGAUsTZ34UB4z2WD+NaetLg1cxXrbfazFBnujMXa4OmnlM+6LOwhOnJWsQU
         tDx2UaAEE23Zz32DegSWuHb2eTDsw6il09QkiSHHrujzonVnDpPuwX8jZ0+HOdefghVm
         scbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OXmlaWM79rIAI06/ZF5KjTIAKOdA+OtWV+MxMSPeaPM=;
        b=n7FjTUeHwk8Wflpy1uP8DdiPmMUcRRtmWb+b1g8ACzAR94MJh2GCQMfWVvdX8Q7c2o
         gSTum3dxrVFjteBGNKlmdxpxquXMlbDDTRt1Ym3r6dhuRgQw2td+if+daG/ZCzQsc/J4
         k8Pfg2Ye0GXJdSBRaMENIiFdFKrx1nqAzK96JuAdaLJAC/gkn5Bl7mu4ih1DO5snkbvy
         PO6zAFU4vEMA7WKkPm2LQaQPX8PTZSibS0UwTFYJ0PMoP5p4wvR88V7KnS17FsuJJqH+
         M+m1gWuU1BUrHfuGjx99UPY82Vk4gzOzIR8T9VWwsdXml5A9jcXxudilGs4pJ39CVg1Z
         OfNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JUAFTRMY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a63-20020ae9e842000000b0073b6c3f3ee6si7814531qkg.193.2023.03.06.16.30.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 16:30:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JUAFTRMY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZLDc-0005Q3-TR; Mon, 06 Mar 2023 19:30:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLDZ-0005OV-C4
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 19:30:14 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLDW-0007aY-Ge
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 19:30:12 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l1so10540858wry.12
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 16:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678149007;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OXmlaWM79rIAI06/ZF5KjTIAKOdA+OtWV+MxMSPeaPM=;
 b=JUAFTRMY2BhV5DWfdDplUSsaChTZnDb4NiF4ps3MbW0DdklN8F8bfL9WNWOK4lKZU9
 Alm71fIUnM11osRVPtscLdyEcfFtwRtKuFsHHWiT8gQ3OT8MkciTdbjFA4mD3AUCZ/OP
 +FWVSH5YP4npsmuM4PqV9ZLhojF2jlc5FV/5uCsyEdNsUjiIpGtmx09akds3daoMwxAP
 8QMFcxvFpkYXivoDIqRSPU4MYEt8xaZX0mFmUxGabaMTRVheL46sODpqfsV0/J68VP+u
 XGKWkNPStVdpva2w54KH6iQrm4ugZXJGRCxLjEdj59IhYdguDs9NwDxTBYdfgq2UYLH5
 toAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678149007;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OXmlaWM79rIAI06/ZF5KjTIAKOdA+OtWV+MxMSPeaPM=;
 b=z/+BlRx2iFvDqob3yRMiErgmIz+4dECU2cckt23y7YbgH6rPzoO059hDQkCA07jqRf
 q1zzZjG0QMSioKExY8U57CH5WZouMDtK6TU8VBm2of2llYhbmSnWyiZDdJucPkhQk0jx
 ycnG/Ue5C/GoZlk0DVuJTpdXAZxkPffqXy4ELf3GthrwhElNJgFldWeVZSUmtGO9E5aa
 nO/C9MnzQt+fcj8GuSMKlRHmHfC7Wajuy3oK59/HOMQFDHAIFFkex5VluFDVdM67/Ft4
 SsEQEcJrCirzDmpr9VIUl5bqs36r227byToz0yJ0TruGNG7RWYGPVGvDNCE8ZYRdmG9F
 qExg==
X-Gm-Message-State: AO0yUKUkRNTM7QYvMG0ulxFsb40jy/vJTDeJe6GLlRzuiaic5gx6Wwma
 gIzOIpmolWf7vuHDmj2PfvLYjw==
X-Received: by 2002:a5d:62c3:0:b0:2c5:5237:3b21 with SMTP id
 o3-20020a5d62c3000000b002c552373b21mr9241129wrv.69.1678149007224; 
 Mon, 06 Mar 2023 16:30:07 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 x5-20020a5d4445000000b002c70a0e2cd0sm10967499wrr.101.2023.03.06.16.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:30:06 -0800 (PST)
Message-ID: <e752b15b-7d34-4728-18ba-eebe4604bc92@linaro.org>
Date: Tue, 7 Mar 2023 01:30:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 14/70] target/cris: Avoid use of tcg_const_i32 throughout
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 3RR16IzGIRe+

On 27/2/23 06:41, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/cris/translate.c         | 46 +++++++++++++++------------------
>   target/cris/translate_v10.c.inc | 26 +++++++++----------
>   2 files changed, 34 insertions(+), 38 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


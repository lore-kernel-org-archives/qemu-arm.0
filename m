Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp242799lfb;
        Tue, 1 Dec 2020 07:09:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdogorEGuf952oUE5Ei/S3v/wyYVxD7vIfV5ex8EULABQb5xnzJlh8xHolmiJ3MJnklWBU
X-Received: by 2002:a25:1c1:: with SMTP id 184mr5323415ybb.161.1606835384743;
        Tue, 01 Dec 2020 07:09:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606835384; cv=none;
        d=google.com; s=arc-20160816;
        b=g9UnvwO/3XBa+zACpGm9ntJAx8M/wTaZAW07b1xKBhF1PdJXfnvXcufaoWepUpRE5U
         9c4awhSutfjEkhj8RciScAAnyJdfsqQfFVDj32Y1JnoALPbrsI9VBKIm7bCXZBOKO+Se
         zDtLehQC/Njm9e65kT3Hs8KgOrLY9jN3DinSgDyFKSI18bb3WDxFR/wZl1x9uuECF4jM
         Yqn7nkOVhheMEkM/7I/OV1HceYHlqqzOqRd2z2DePfWjBzh/VEd4kmIhS37JVlnyxFAK
         9TdXdMHHX3mpZvL6hgzSzF55XZACALpzukjDbkJdjJF0qJbclHEu51kzu/ymHhEyeSIW
         0M6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9413uWbCOHAyYVe7UpQ0OVZPp989TNi2ypQujH/Cf2s=;
        b=oPG8zD+fagOYrchxv5MS/trtT5lORX0UNl7fy2QCeNEnHmzLVDoQbrb1W9DcmAiK+N
         skAtM1AQsaeTangpOALsLya6EywBPbWkyt6ntrrgMV80PzAVkw2dXjR+bOo++iC/u2Rb
         kwlA4DhwniHjd0gJFtWw7k4/9QxDMlBy3Bey01iUyvu+Gbb5BOvdo7S1sfyVKLgYhuLc
         1g7Y3eGvtT7k4Da+7o+Zlr3lYBe/vmxV7ZC1mVvKS/xCEsHz5QGXeUOrrd9xmXd7g++t
         Agu1EH8nII2hHvLXrK2LHSPMZ9jUEhmx/7G03AR8PYZATAJdlig3+8s0v4FzaI6R8BtD
         S0Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XynCgvoF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x37si44122ybd.196.2020.12.01.07.09.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 07:09:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XynCgvoF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk7Hk-0003kZ-4v
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 10:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7Hb-0003jN-Lg
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 10:09:35 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:36942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7HZ-000891-Bz
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 10:09:35 -0500
Received: by mail-oi1-x243.google.com with SMTP id j15so2062449oih.4
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 07:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9413uWbCOHAyYVe7UpQ0OVZPp989TNi2ypQujH/Cf2s=;
 b=XynCgvoF5821nffJJv0kf6ySADCX7Ud8wqDao/gywJU0AFMIbWytlY7+XF+St07vww
 44taZFIQh376aachM8fEaGWvgL/XCPmRUkVevdJVJU1I8yIFmbIzOJ5KGcMKgTYzKDyy
 NVhamyBclA50J+8Lkvs/TfjDKx0ZA0/9nyJjINhyOXXh0D2LAQkRVP6Bou0mGLTn8sh4
 7tNRseVI/2xzLZLkd0ohOwFIU+xs1jcGzPE8lGrFDblYcLRJKWAKVXxNe/ZstPf/0ZrJ
 57C48cdVcoc+qunMxS3lqIFAbDtu/I0recG1nMPNwoc1E4mNs8vcRH2QIYDQTQKBV+od
 yOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9413uWbCOHAyYVe7UpQ0OVZPp989TNi2ypQujH/Cf2s=;
 b=NsLPF/eTYhmZbY1tMhLVuspQtvsf4OOCS5ZPh1UD+vttiWo4RfT75txZcXBCcq20YA
 wrImYUGJIPJu9SfB5BtHDPhJazFfLoC4vDrTTTD8J53ogJI4c6U/yZMYtKF90/vuYCA9
 eYfIAxu2roR3MzXOnuoqw3+e8DvLaf+R3/h+DCtJAZfJ5kQCbg0fGfqE9eW01QSrJr6A
 1zyNt/PPaaLtzYBhvyGq2XQeGNdhX7toJjxlTcfmkfebo3eMdDqL5m33qnNfBP+Q1YjW
 JGPK8b7V7zSo+tPXMUEs43vrEWeCEoyZcxhVSyTXmCyCklN0H7C1R1A42LVXAYIDDbI6
 ZdbA==
X-Gm-Message-State: AOAM5329I8uiyYVhptbHnKWb7EPQZ5mmaDmSyZgVNJGoBMAsfy7qm8x9
 1a9bNQ/MW3VPcXuPaf3ohRTk2A==
X-Received: by 2002:aca:452:: with SMTP id 79mr1989364oie.108.1606835371915;
 Tue, 01 Dec 2020 07:09:31 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id f34sm419143otb.34.2020.12.01.07.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:09:31 -0800 (PST)
Subject: Re: [PATCH v2 20/28] target/arm: Implement new v8.1M VLLDM and VLSTM
 encodings
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a20d1c0-7734-edb4-8078-ab18d2834cb3@linaro.org>
Date: Tue, 1 Dec 2020 09:09:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GwVIu9nlHJeQ

On 11/19/20 3:56 PM, Peter Maydell wrote:
> v8.1M adds new encodings of VLLDM and VLSTM (where bit 7 is set).
> The only difference is that:
>  * the old T1 encodings UNDEF if the implementation implements 32
>    Dregs (this is currently architecturally impossible for M-profile)
>  * the new T2 encodings have the implementation-defined option to
>    read from memory (discarding the data) or write UNKNOWN values to
>    memory for the stack slots that would be D16-D31
> 
> We choose not to make those accesses, so for us the two
> instructions behave identically assuming they don't UNDEF.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/m-nocp.decode       |  2 +-
>  target/arm/translate-vfp.c.inc | 25 +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


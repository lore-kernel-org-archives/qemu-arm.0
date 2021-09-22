Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3640095lfp;
        Tue, 21 Sep 2021 20:31:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaBrKCYdkak7RQXojDkxiax8EGE7Ydjc7yQGENwy+7qXzCV48+B6cn6Ri2FUc4JDbqzs/n
X-Received: by 2002:a67:c997:: with SMTP id y23mr168016vsk.6.1632281463635;
        Tue, 21 Sep 2021 20:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632281463; cv=none;
        d=google.com; s=arc-20160816;
        b=guT9wG2D7DfIGCX4Pd5uvfTRDvYKysRouCmLrKy70oRU5lDY0usz0+DljBHZRkOdGR
         w5LXlC9mGmFpU7Kh0pkz5azyACDI+ZcTv42bRD0PavxbKP32OOGLsF1pFWv2Ak5DuKDI
         dlZk9Fh1nG/D/JgWoRIqvlpZyaDKudjTSI/b1Fo4ikjE6Q4D7A7yic472FtmESzHYzRv
         ouzumoQ13n8jeyMHUzylZ2tBrcwV8YwhRGk0xo/n8mMlET0iM9iq4dNpnQvYRMdbYT4J
         pht/W8pr4m2HesPuqMP55l8uE1/K4cX9Q/Ndr9WGugMDBShR8Mykn5rIpD3GH7ZBvb5b
         1P2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HK9CBsclwXg6OQFAppgK1STu6sDNQ2hweze891lHAkg=;
        b=N9+/wgP8E9RN5MHhuulNwZcVPDNfKYWAgAcHXdPYXF2CvGJv06xHxWzmdDCdW2qvj5
         FtYZI2A3DzcKEilL4hz5OwDQq0Gh7HgHjLKG98aIJchtzijuaeGUuVNQmW3gQQszTKev
         KHUaB2GyuIQo8oovr5mQInBmwKh/Al3RfPbjUjLQmKojTNpphAQos7nt4ZvnE3edvU3Z
         xaCn6Y6v22gBqmIDwVziEWj75jw+mlmuCPRUC1c4t8gbzQGGgW2cQJL99nl04Ro05t8d
         yxsrF+udWqr3+acLhGwqC4dKM9ZMWS8W72Iky8nEg9YltKhKvkUEDJQasjAJX3/m0w41
         3r0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ocR32tKu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8si914826vsk.26.2021.09.21.20.31.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Sep 2021 20:31:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ocR32tKu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSsyM-0008K6-Uw
	for alex.bennee@linaro.org; Tue, 21 Sep 2021 23:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSsy2-0008Is-Jb
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 23:30:42 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSsy0-0008Iu-Qf
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 23:30:42 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 p12-20020a17090adf8c00b0019c959bc795so1222414pjv.1
 for <qemu-arm@nongnu.org>; Tue, 21 Sep 2021 20:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HK9CBsclwXg6OQFAppgK1STu6sDNQ2hweze891lHAkg=;
 b=ocR32tKunftBi31rIIhh9TxXeFZJynkEwWYtquZ+pkZqw2mBBWyPREQ3nOZ6UyLp0s
 Md0yMWQYuc1kJLvAvkgIERaUu29OkSgN3tJ6G0TM22qj8giI3Ei26ARFx3kmRLCvkI0P
 NeZnVAoKkXZzDFmYH6XYcteQHn4gxyy15jaK/0uPEjT1lyjmTW7vTFIeESr0JC5d2nSm
 WUz1DfsDt+dVHsvOTIanJYtGY6rRrZYR2Old2nFhx+XbUdgkY/wto8+/gJPQ6uMrffvC
 R5jQGhOGeUl3XD0MCiUuVsBN+Y7KJuQ21GLxWPNusfAVqvrI8KQVyJ8BWP5P4sr9WP6E
 IA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HK9CBsclwXg6OQFAppgK1STu6sDNQ2hweze891lHAkg=;
 b=ZHXPcAx5Lr04ysNfx99om8gP5x+YoIO1d8u3jVDFeGGRPbTgGdUxWLo6ER5Ottsrby
 asKLA5fBrkX+kabd0hTKDsRh7twXwfnQ/nBlfi6O0PInA/wBVrK2VCedAYiuK4ALjUY8
 zqb/HMX4dubKbm/xQEtUf6g7StvWwwbRB0+VsVOqTl79xQFgLVC8kL+rABdBvTHua52Q
 UU9bGGexk8r1fLxIwPAnybRUXWUMn2j2ZHaXTwbHPRQNi6T2Oizh8IKDn2m85VLMe9ZC
 NtgHwwMUW1e5/UF6CONQtkPEmwfk9BdZBqWb9Hir7fP0MMIMxemF5x6WIAVvmU0gRQap
 hAlA==
X-Gm-Message-State: AOAM533eVFwHG8x0k2R8I8qeKzcvZeA6fpsZYB+kx6ostMCzp+dHfyXK
 WWIT4oDngwdsqSqy21lUlaWgnQ==
X-Received: by 2002:a17:90b:3904:: with SMTP id
 ob4mr8874237pjb.148.1632281439315; 
 Tue, 21 Sep 2021 20:30:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 26sm621284pgx.72.2021.09.21.20.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 20:30:38 -0700 (PDT)
Subject: Re: [PATCH 4/5] target/arm: Don't put FPEXC and FPSID in
 org.gnu.gdb.arm.vfp XML
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210921162901.17508-1-peter.maydell@linaro.org>
 <20210921162901.17508-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e7cbadb7-b475-2fc3-7813-e42519282b59@linaro.org>
Date: Tue, 21 Sep 2021 20:30:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921162901.17508-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vcHm6fwibPNN

On 9/21/21 9:29 AM, Peter Maydell wrote:
> Currently we send VFP XML which includes D0..D15 or D0..D31, plus
> FPSID, FPSCR and FPEXC.  The upstream GDB tolerates this, but its
> definition of this XML feature does not include FPSID or FPEXC.  In
> particular, for M-profile cores there are no FPSID or FPEXC
> registers, so advertising those is wrong.
> 
> Move FPSID and FPEXC into their own bit of XML which we only send for
> A and R profile cores.  This brings our definition of the XML
> org.gnu.gdb.arm.vfp feature into line with GDB's own (at least for
> non-Neon cores...) and means we don't claim to have FPSID and FPEXC
> on M-profile.
> 
> (It seems unlikely to me that any gdbstub users really care about
> being able to look at FPEXC and FPSID; but we've supplied them to gdb
> for a decade and it's not hard to keep doing so.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

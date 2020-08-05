Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp215007lfy;
        Tue, 4 Aug 2020 20:06:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8re0dapJqayofluaa25V6VPM+rwSyzGguspw1H800FtZX9iXIT+JHFBmOskvEkUPduEWs
X-Received: by 2002:a25:df83:: with SMTP id w125mr1670526ybg.112.1596596771519;
        Tue, 04 Aug 2020 20:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596596771; cv=none;
        d=google.com; s=arc-20160816;
        b=hOUquU6CulK/hiy8ockxWRDGtCOcjJVCXTU2N61enhUgrmimqzK2uraRV5bQVhCCaO
         SZVSdOhWDd8qLHySDWOakHCv5FbjA7IvO9GAF7SOE3GWZjRztsy+iajZepX8o96z3XBj
         +U73ma29Gtwxv1jhmPxH/9rJrjXHfbmSBi3Lpi0dnxZ/F4je2Y0x0qbqXJnc4+FmG7XH
         5NLpJFnoxQNY4Cney1RJ6HhPpibnqnUbNt4yA3/GsgXp1Pq15R9dNjxhFN5KDwastFYf
         qMdB4hcRqYPr+THHJoMTFcKWl8Cr6Q14rYoAHv4yoqSjbvO9V9iPVdD1xtv/MTg3ycx3
         Pidw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BZUaSnUHLF8B/CkOLpByqJ1k6FT4aJ7iz41Ji1YYkYo=;
        b=oYY7ODAZRFXF4Im+eq2vPVIR+enMGkUeimcJXVtXC1DNFBQKIZPgiHEDHb2cLoWOdU
         XWnzbqo4seF2AuspqWGebneZt/bpnbHDI9OgaNEtEr6nTOW5CUV5YrFGftWgg4vAHO6S
         24qSJTjHOXoXjGueoHL/3mC67rYiMzHscF2uptAjyGLzwpAsa61IQF5HAOLffPZR8C08
         uGYT8nVGr45+ISfsOfK259KBDqRc+IYXzC44nzGsNUCN6JgmN4wX6UU6lFAeW8Ll2J6N
         S576z4Ro2xpJ3Cfv1gb0qQ9RFi0yHqpHxUxssxO5EwQNR2p5uSBWcYqCMO8I49wCVAXV
         H/XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LTTkXEBj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j137si818466ybj.253.2020.08.04.20.06.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Aug 2020 20:06:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LTTkXEBj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k39ko-0006O9-Uq
	for alex.bennee@linaro.org; Tue, 04 Aug 2020 23:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k39kh-0006Nd-3Y
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 23:06:03 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k39ke-0005OU-9Y
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 23:06:02 -0400
Received: by mail-pl1-x644.google.com with SMTP id u10so14970831plr.7
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2020 20:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=BZUaSnUHLF8B/CkOLpByqJ1k6FT4aJ7iz41Ji1YYkYo=;
 b=LTTkXEBjmVnyHf3IkrNVCLizAu4Vs+LuJajUwWKpHheMdnLLoLNcNtSfuLl9VJbEjd
 3PRIiz19KTiOOO73arvqMgy72YE+XmZKTi7SjyjBO1f9X5Iv3VK+mBOxtArI3gvYTGRx
 oHJS/IGhsAINX0vGDeQlTHP4I409bxNzK9PoKfsQus+qTArvleKpGvVFdkIKnpyv6T/o
 VvBmXxaJ4nB1bncfZK6yU/SNyj8GNqZWnpaGMd3LeiWQOBBjfitzK30gIubVGK6pmTg9
 03srcwZNZKggx7AF7CGJWAT5UbSvCtNHWeSVXtn7Gmmcq89xtGy2WhU33bITDiMGCh20
 ItDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BZUaSnUHLF8B/CkOLpByqJ1k6FT4aJ7iz41Ji1YYkYo=;
 b=Fs7HfWCpm2LrdSY700WT3BsJbtE5Ybt6uCGDl5EzqaLi/Cb+FULgEBScMlgryvmOK7
 fWSvvno578sbPF3+vfofS4b5TpWKZE0pULUbW29843iqrJvk2oQziPXcZ7kbpcIObuSR
 MBh4FjwUt3GWsPgFcanWQb7qcHxpiu2FHIGPMCtZZyx7eUmSz0XlRlvxPUAnIK1+1i+L
 zjfdMFALHcnjUvgrnV6AB4Zr8Twnp7gmRGNdrmIR+sbBdFmrrNYRZiESr3Msg5vU7HzG
 LZuCrReh5drea+P7mTvVaRZbdXwIL7o/RS7LkEoGvAzAF2Am7WP6ItLQc2texDy1Sn5R
 7V2w==
X-Gm-Message-State: AOAM533Cr/zWGokv/qBqQ5awm+NnwJVPHr74Buslj4KrZjohyKN5moKW
 kMbaopZoNY5MU57bvvPJP1WgZA==
X-Received: by 2002:a17:902:b089:: with SMTP id
 p9mr1175316plr.52.1596596757924; 
 Tue, 04 Aug 2020 20:05:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h14sm785378pfk.195.2020.08.04.20.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 20:05:57 -0700 (PDT)
Subject: Re: [PATCH 6/7] target/arm: Convert T32 coprocessor insns to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200803111849.13368-1-peter.maydell@linaro.org>
 <20200803111849.13368-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ade5c2a2-d730-b455-496c-055da6101a0f@linaro.org>
Date: Tue, 4 Aug 2020 20:05:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803111849.13368-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5i6x+hXu4S+Q

On 8/3/20 4:18 AM, Peter Maydell wrote:
> Convert the T32 coprocessor instructions to decodetree.
> As with the A32 conversion, this corrects an underdecoding
> where we did not check that MRRC/MCRR [24:21] were 0b0010
> and so treated some kinds of LDC/STC and MRRC/MCRR rather
> than UNDEFing them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/t32.decode  | 19 +++++++++++++
>  target/arm/translate.c | 64 ++----------------------------------------
>  2 files changed, 21 insertions(+), 62 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

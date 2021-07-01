Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp679070lfi;
        Thu, 1 Jul 2021 12:27:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy2tMQZtpsYCiR+Nn+thPALECJzuNWh6FZyAhsSNuXL1nlpHBtfYesY5ffEUPt9uGJgPSN
X-Received: by 2002:a67:c59a:: with SMTP id h26mr2502870vsk.10.1625167662148;
        Thu, 01 Jul 2021 12:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625167662; cv=none;
        d=google.com; s=arc-20160816;
        b=ag9jbm9HA4f3RYN6vv6gigfa3wd6hLrKwd5WE9BlgOGuGP8z/VQnOIdvLNZnOARmsQ
         oTZyJgEYSZ3IcAMEtAwXOpUVxWwlzNRt2gw2a50BHZraKxA7RbxR8CRpH7r2rGxz4YJf
         Om3/A2uLzfHaiFS0M5lNWXOdUvmUF9V8s/jK1GAD0TCilZCHaFzdwVZe7wKxwA57RW/x
         gbQxgkvmNNthdSLcyRH/5UQvC2kMnCL8PLpjnNnG8PneUah9u7Oo/Nl1Z0RJUi3/5fyP
         D9Ksep5wo/DJQ5by5dsXtvb6rw6e92PgWnTLwUjOlgVuyFfOdd0TfE15MKJHgwezPhp+
         8D5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1o1PTLpg3F44NwwaXVoTaZGkpdjcyW7RO02fMHok40g=;
        b=hkx+TDhDlRBykZKBQS30E2QRXCy2L74rMlp+P71D98oiKTqAbVvL97lvnnJxUB6SGx
         wWzHpnpFMQ6CARvBvxT/SAhTz+AnQK7zpNH/w9lB7hZzAKl8jf5Yy96nDIz4OaCmnlDN
         aoQgdADDPyns33XV/+Q7z8zDRzRSZUr7WIQnp85xsvhso/edFW8oThixhsv7UFH9bJrW
         Col8x/URBgeokNK7r+q/yptsDbA0SzlkNwOU3kU/Yn/B+xqRlTgnLr7PhyqOFZDUMw40
         KEYVOkKI/e/6eKIS8mda07svv+id1dRs4zlzKmb7osYQDijUgXPukigJnM0eT9VEXdUU
         wXQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wOgPmqul;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb10si830805vkb.1.2021.07.01.12.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jul 2021 12:27:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wOgPmqul;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lz2Ld-0005CU-FN
	for alex.bennee@linaro.org; Thu, 01 Jul 2021 15:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lz2LR-0005CM-0B
 for qemu-arm@nongnu.org; Thu, 01 Jul 2021 15:27:29 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:33736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lz2LO-0006EH-Q9
 for qemu-arm@nongnu.org; Thu, 01 Jul 2021 15:27:28 -0400
Received: by mail-pf1-x430.google.com with SMTP id s14so6864775pfg.0
 for <qemu-arm@nongnu.org>; Thu, 01 Jul 2021 12:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1o1PTLpg3F44NwwaXVoTaZGkpdjcyW7RO02fMHok40g=;
 b=wOgPmqul5wZHctdzmq8e5i1KdZS+uXuZunHddtXv9ituH5LfOQvB1Wpm3XctTPjtPy
 WEs6nowdvSwqehqGBdIKxKHwpplWIXm6FUDU5ERuETu6rZQZ8eUSaGPrNnmWYblzbQ1v
 7QSbIkszWi0q3ZtpdPCsarHOYLG6cUeCY3mJcV60XjebOSGAA+jK7U7dV836Ax6rornh
 ook79U7okR/SMqf3z3qwZRedwzpy6ElDBtLKl52A9ATq9V7hMNZlcpLIGUj2DSCqRAH1
 OoHiI+u/TLTlqClzeiuS1Mdt7Tgp8XHjnAPxeCl/a2p4kbmaOk5yb69LjMAfkRo0DHHX
 XWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1o1PTLpg3F44NwwaXVoTaZGkpdjcyW7RO02fMHok40g=;
 b=auL8yQw/sn511bBbSqgpCtgomya9X6SRBJL/cUeDUUPoMR7tTWLB8eIG6+iw4DVTVa
 hLh551UTHJCRYZpde/dJ9CDgw2Z6kRZdL808TQJUqDbAYYTyxIoodl9jj2MWR20gfLxT
 EiW4xJvrLoh965d/VuYTAZcUtDA42L4YtUcSfoOJ3+A4epVi1hoV/8b3dY7Qx3BJLK2m
 qKChhXa1cpqE+5b3VL1wgY8NA5tZNYB1KSG4/uxgUoJcaiLeah9PPnHbNs/NDgD+MOt1
 BqwVzOxQkVJCdlR9NH5h3kM5+A7Bp9qSXaK0403DTCB0qbPq+u8qQJ8NgZA6ChmO/e2Y
 D3TQ==
X-Gm-Message-State: AOAM533kWLERug7xVajLES6ObiuJAs3H7TVESRLf8wD/BSxhaJWkvTfX
 Bjae8KhO/ERtVztxUMG+05crqg==
X-Received: by 2002:a63:d74c:: with SMTP id w12mr1108776pgi.91.1625167643830; 
 Thu, 01 Jul 2021 12:27:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x17sm819286pfa.26.2021.07.01.12.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 12:27:23 -0700 (PDT)
Subject: Re: [PATCH v2 02/23] linux-user/aarch64: Implement setup_sigtramp
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-3-richard.henderson@linaro.org>
 <CAFEAcA8pbG0kp_un++SzGfyVZw0FOMVU7zdyBCa7YKsCMeAZuQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <27acb275-4819-1160-ac2e-9fb3b9a9abe1@linaro.org>
Date: Thu, 1 Jul 2021 12:27:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8pbG0kp_un++SzGfyVZw0FOMVU7zdyBCa7YKsCMeAZuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iK+oqJ6Imh+o

On 6/29/21 6:36 AM, Peter Maydell wrote:
> A little way up from here there's a comment:
> 
>      /* Reserve space for the return code.  On a real system this would
>       * be within the VDSO.  So, despite the name this is not a "real"
>       * record within the frame.
>       */
>      fr_ofs = layout.total_size;
>      layout.total_size += sizeof(struct target_rt_frame_record);
> 
> That now needs updating, because we're no longer putting the return
> code in that target_rt_frame_record.

Updated to

    /*
     * Reserve space for the standard frame unwind pair: fp, lr.
     * Despite the name this is not a "real" record within the frame.
     */


> I think the 'struct target_rt_frame_record' now does correspond
> to the kernel's 'struct frame_record', right?

Yes.


r~

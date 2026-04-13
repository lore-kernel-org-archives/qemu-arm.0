Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219D4EBFD38
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 10:49:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCEqq-0002uc-8x; Mon, 13 Apr 2026 06:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wCEqj-0002oN-HH
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 06:49:03 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wCEqh-0004D6-GY
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 06:49:00 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-651cfaa21e6so517803d50.0
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 03:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776077338; cv=none;
 d=google.com; s=arc-20240605;
 b=ARLAJ0+fM5qbLuTaGjb7zEu6jqKeCp0dppp04+0yZrcekPPMgxun+V5jo+MsZWaXsa
 ILv3MKz1yEVqqSMnsczG0dWNdNweDnZWKEuxBtbBCK+0mjperqar7+ixM4pkdy9IV5z6
 bU4prklwPfee/X46PBlq6K3BPdAxL/pfmc9HmecPRv1UtjfTS0k6jmLHrXmyjI4tHkqJ
 Knif9I9R5uZSLu0sLqwTxa/VAOf9t7hMHeVsGAmu430i5tE449c0Lrhnojcljha3ftzQ
 nVhG8WHo2nx+4I6B01xMa0XshS5Z7kXhvrtG6TK8uRoA2XTkPYd8LTJ1W1XfoEY1WH3w
 fnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=T/1dmromYxTFvEtNo6SmDGXtOxL0QiWh3YyyT28njEA=;
 fh=7vUCxZaMX4Ndd/cld7PV4FZ6Qa7E6ZZDIVwUz+taqmk=;
 b=ikq+7hS7PzdOflQsYVGdPdcBL0YR5UFECmIya8NLNOCwPRN2qNQPkzmvgH3GB+iWMd
 qppBd9H9poBaDp2E4FcKjXaOuDpGL8P7d7VHU1elHRdZB3ZFu+uc7X5hNq+5wBv2k0Jv
 3VlUTQQdXfl5KLUM88l9qHMiKlSHsXfuua16HF4RnxRLc5ZCoFLvd7KVRNYOjOHa00Tq
 IbcsGlVnflFbKVgWDnSrFLAS1/6+2X1vXEbwv7cSu9zIg1eK/cYP4VxoKk40jeqytGLu
 KMgW7nnJdjQzeP0gDVjErDmumrShNkz2IjRB/drTy/SO3XjM+prjGd6GHeSN88OQNcxV
 Kn8Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776077338; x=1776682138; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T/1dmromYxTFvEtNo6SmDGXtOxL0QiWh3YyyT28njEA=;
 b=wFqzrQ8PtMiyHRaxYHvbi/5ZQfgrCDl3rRi3Veilopx8aa1M/Wg5s598tYVOld8/9q
 i/1zGUAiSEHWtDScoo7Snd7sHIyIM3jlexjYXiIRudkcXm66l3ujSYuuUVNu3VkvOLc/
 wiiXdrUvmjJt3xEWm9rgIxrN6l+erZN0YXEPvNS8+rDN5l4517S//mItgiyy+OVPeRR/
 KvTPqNqOUa0XXCq+Pj2bCoEluKdSiMTpf4u/VKQkuzTJMok5KzsjUKwD5T4gwWoT9amh
 MxFwocVuWFNPMQIekbH/Lg9DQicx+HZY6d7eNqCgLw+92IhKjLOipo94eg39BDNH57Mj
 cxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776077338; x=1776682138;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T/1dmromYxTFvEtNo6SmDGXtOxL0QiWh3YyyT28njEA=;
 b=pa/KEtCrvZgU7cKF5/bOBdtDk54hCwDFGuHRGCBVWVGnZfYmQ/ImK3y81tIrhXUv6g
 NUfxtDJ5YEudliLu9jR8v4XEQ5edthrKQ8YBELDtlNcu3R7kmUHfA2R0NJbAFD5K8n4p
 W2lqFUdeU01L+sC3LJeKqGB3XZYcjdJleU4VwQSNDuBnbickjlKJJUu4grAKhUOm7kb3
 NiVHvuqN0FW50/I1PCJKAAWfDBN5yJJX4ir5B+yG8IsvlIedhKbdA/iGGXq2CTaKT8x3
 WF0GtQSQ9YTAgwrWdJQmKG8/kx9Du66WLKNgphxXmj4WuF06nYo3gXYEjObvdARlO2Vl
 6Nsg==
X-Gm-Message-State: AOJu0Yy3zYYvbubHrhBwHWAFSJqv1qh9Gm1d1tPWPYvlpYNi63sdGnNM
 toY4lvtg9Er4UZ4mDQi2iBm4ivK8zsm88BLhErV+N+mamryYN2zpbxP8ccikIVD4TAAs6TB9zsv
 oPxRZgvwAdn7ug5b+ie3jt0lv/JIKgIof0xk2l0x/Hw==
X-Gm-Gg: AeBDietthNhMfkAoKrdTGkHW8TBjg4mh6GfMJtqSxv2IsEE+M6Fyxewj/K+7ZEevjEh
 PmMlJx2J0umfQp6LMH/DVysEQtDTZKY4Y30byjuO9iG0vMZbHYFPtOcSfEeRRtHcNYfuNW2l42k
 PqfDnXzE4nbzz9to9jefiTsNz/0190njYTXh9V7zfNRLnNEmfHr4JWqZiH/jb3uLkytJLZY3wRs
 ovgeLUsQfi3r0mhWwcrQNeoGnPX8+kvCNMqFSPxy5T2o8LYwJ23TPgcWhwquHpfQ/PWG6dkNFev
 YKjNtL4J72yCwFx9XDXf27xKCmv+ZNUxRCv6OrfJrm03FpjW4UUdudxIq2yjQ9JeV2E=
X-Received: by 2002:a05:690e:1308:b0:64e:e898:10ff with SMTP id
 956f58d0204a3-6518726a297mr13533121d50.40.1776077338101; Mon, 13 Apr 2026
 03:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260413103754.45745-1-peter.maydell@linaro.org>
 <F20654A8-2ECB-477B-8B64-9688B5FA9EB6@unpredictable.fr>
In-Reply-To: <F20654A8-2ECB-477B-8B64-9688B5FA9EB6@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Apr 2026 11:48:46 +0100
X-Gm-Features: AQROBzA3EHEWErFX0uNKwE_BDfcwG573kit_NzKi7mycu2Ipws6rncgdJlfDD_M
Message-ID: <CAFEAcA887dXAQ153Z2ZqjpDtUtnpGAmoBwet63CTyn=wLtn1jw@mail.gmail.com>
Subject: Re: [PATCH for-11.0 ?] docs: Deprecate Arm OABI and NWFPE support
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 13 Apr 2026 at 11:45, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
> > On 13. Apr 2026, at 12:37, Peter Maydell <peter.maydell@linaro.org> wrote:
> > NWFPE floating-point emulation handles the ancient FPA11 coprocessor,
> > which is only needed/supported with OABI.  Our implementation is old,
> > untested and not thread-safe.

> Especially that this has ISA emulation code inside of linux-user (!)
>
> If this is (unlikely) to continue to exist, it ought to be moved to
> common code for system emulation...

No, because no CPU we emulate has an FPA11. What we're emulating
here is the Linux kernel's emulation support. You can look at it
as a set of syscalls with a very funny ABI and very specific
behaviour :-)

-- PMM


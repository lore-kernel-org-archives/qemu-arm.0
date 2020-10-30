Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1539014lfa;
        Fri, 30 Oct 2020 06:35:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4L84lzNEmmcyozi/uQB5zyMhFeCBUZXnUBGHejz4BSts1y7hWX9kG6nhzBwvrx5jjPj0R
X-Received: by 2002:a1f:248c:: with SMTP id k134mr6539919vkk.14.1604064913951;
        Fri, 30 Oct 2020 06:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604064913; cv=none;
        d=google.com; s=arc-20160816;
        b=af7qWNrrkr4aJi1wDlzrpnfiUelm4eBYLCFA4quRgGiijJHIpSGojeyr6D0gK7/lPv
         YQTj4FP9pwbz9gGI2g2M28Fktr+vtvzjl/xvBpW8X4BExyslMsPiyRLMOTMe+gtZCALn
         nNS76wy6SWhajgrmlC0ldeI2cF0o/tz+jGIHkzqTLWTEty9JXhEna1D9xERLTB5M5Fts
         xfrz0/bC93pItUc71oDiC0YBmF4/f9lIq6FAk7qZoEgVy0DDsM70Or477dOeYmFNQ+4Z
         mnaSqNtTlh2f/FzFXa4KypcnJAAWYAWcGQP0x+AtE/6zT+EnEz1NnICxQR4oPx0bugHC
         jIlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G7JfKGJGCmQ6dccOnGzetPbHmR3VObzYH/qAOt3oHR4=;
        b=Ni3yQn99F27IjUv7wA7LkgIQ6U6m4ysBp3us7e5zqDvgw/9EnjJ/j2weazc0F5KFbX
         7RMGCnjI/P7wJaPnHKKImRQ6miE+uhag1aTn2+mSgeraaIEXw0ROoqmGGcuMTVNBiIRa
         qRByvVC/2aRzHAYBg1CWLWi2LWsMlM84TzgKOvuo4DaIIXmKrGyAad9T0Ji8tKOm5ws5
         irX9673jvcXInLqVexA5xzyLwtd8HhI5cTD+tY0mXzgkSVMBQymDy8klHi+krCuIBB1S
         R8qs2eNJAfJh1w1wGrr8LF1nf4zn6td909cvgBpAU8NlDA3wP0gr5uYF/oJ+dZJHU0iq
         DLsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jPzgU1Q1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u187si1155211vkb.1.2020.10.30.06.35.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 06:35:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jPzgU1Q1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYUYj-0001Df-Bf
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 09:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYUYT-0001Ac-7n
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 09:34:57 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:35764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYUYQ-0000p4-OS
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 09:34:56 -0400
Received: by mail-ej1-x644.google.com with SMTP id p5so8687486ejj.2
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2020 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G7JfKGJGCmQ6dccOnGzetPbHmR3VObzYH/qAOt3oHR4=;
 b=jPzgU1Q1Z5a+vf6vJWUUlfJxGxNjj+ue7LffW1KRY6VKK8wAdDNckO/SynYevkvr6A
 kJxJpU/uLHF7THMdRnFqggx/DRI+jaQgD9xnjUq2qGOHfKbYfSUG5ccuRlhuVDyfPAFs
 SDfrGI78J4x90N/9vbcUteZfLK3hAZjwneBXgWX6Eb2jASBCVpWajOeI2J2ORzZelPrp
 0NwdGSu5ORKi/CqHoqxT1alYmeqwlEBeGyr45N7WxJQck/tNwjM90fVXe7VFNxSj8jI9
 0ujnkew1DaI3cDk/SySq9s7iN6edF1LE60WZkYIkvSS8Nb4nLQux8mH1uA1HReJOF3JC
 aHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G7JfKGJGCmQ6dccOnGzetPbHmR3VObzYH/qAOt3oHR4=;
 b=SKEvatJYYqGuleCEk8UXPfQ4Y3ndEknjtEEyKeI+KnhP2GM4HyyMn+YlUpwbr4zkjH
 TP/d5RZw6tGsA6qRjrMKxS3ilGHVbXJLvKByHOLSjPkdTPqL/gzUPtpqau6z4H320yxw
 damRN72rvV666pQHiG4zE1/FITXYNaHflVeTqZ2hxDoZouzP3YOa2rDeYQ+dZW5L8fNM
 4tAYYoof/MGjbkVOBAMsBndvbY4XZWfKH3Kc5JQFIL/bcFqUvWuNer+lotacFSG1sK2v
 u9h6oIDtreXQOWcZGN8V9ZzbOn8yPKVxkyPs+0Ucyy7xzVsd8qM/isyHD05yYB3jR/EM
 37wA==
X-Gm-Message-State: AOAM532JYpMjD/pjS7ZdEhqxkgjVGmacG7bNmZxX9tASorVaxsG3DHXe
 HRtHN5T1vwkPsrPrnCsUsh/9RtjNTjFwUFEEmfF7Ew==
X-Received: by 2002:a17:906:3a97:: with SMTP id
 y23mr2497066ejd.250.1604064892894; 
 Fri, 30 Oct 2020 06:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201023210637.351238-1-hskinnemoen@google.com>
 <20201023210637.351238-5-hskinnemoen@google.com>
In-Reply-To: <20201023210637.351238-5-hskinnemoen@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2020 13:34:41 +0000
Message-ID: <CAFEAcA_w5j47qz+L02H10UbmyxwD4sxHPu8h2mAinME08Mjkqw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] hw/misc: Add npcm7xx random number generator
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>, Patrick Venture <venture@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XFmnNFTzZkk+

On Fri, 23 Oct 2020 at 22:06, Havard Skinnemoen <hskinnemoen@google.com> wrote:
>
> The RNG module returns a byte of randomness when the Data Valid bit is
> set.
>
> This implementation ignores the prescaler setting, and loads a new value
> into RNGD every time RNGCS is read while the RNG is enabled and random
> data is available.
>
> A qtest featuring some simple randomness tests is included.
>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>

I've just seen some intermittent failures on the rng tests
in this patch:

PASS 1 qtest-arm/npcm7xx_rng-test /arm/npcm7xx_rng/enable_disable
PASS 2 qtest-arm/npcm7xx_rng-test /arm/npcm7xx_rng/rosel
**
ERROR:../../tests/qtest/npcm7xx_rng-test.c:190:test_continuous_monobit:
assertion failed (calc_monobit_p(buf, sizeof(buf)) > 0.01):
(0.00800994233 > 0.01)

(on OSX)

and (on x86-64 Linux):

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img G_TEST_DBUS_DAEMON=/home/petmay01/li
naro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-arm tests/qtest/npcm7xx_rng-test --tap
-k
PASS 1 qtest-arm/npcm7xx_rng-test /arm/npcm7xx_rng/enable_disable
PASS 2 qtest-arm/npcm7xx_rng-test /arm/npcm7xx_rng/rosel
PASS 3 qtest-arm/npcm7xx_rng-test /arm/npcm7xx_rng/continuous/monobit
**
ERROR:../../tests/qtest/npcm7xx_rng-test.c:211:test_continuous_runs:
assertion failed (calc_runs_p(buf.l, sizeof(buf) * BITS_PER_BYTE) >
0.01): (0.00198053202 > 0.01)


Are these just "we got a bit unlucky in the values we got from
the RNG" ?

If so, we probably need to disable these tests from the set
that we run in "make check" -- we can't really have "there's
a non-zero chance that the test fails" tests in our CI loop...

thanks
-- PMM

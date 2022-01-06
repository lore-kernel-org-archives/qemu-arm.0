Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1043064lfb;
        Thu, 6 Jan 2022 06:49:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRYSzYIQHXcE6XwFvc4PIW2lYoBUJf4lE6iyHzIi7/0k5UtROovzYuv/syfMDtcCzUiXu2
X-Received: by 2002:a25:d78f:: with SMTP id o137mr60834292ybg.19.1641480549528;
        Thu, 06 Jan 2022 06:49:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641480549; cv=none;
        d=google.com; s=arc-20160816;
        b=Fbc+q7KXscbTBRZxCLcEErX/IiLIuUpdwaOwAOvaTjJ83xyk4aDFu292KR36alr46i
         zwOWFYfpm25ocp/6wl2OH0qDZMLflS5UKzfd+6Qyb4QcEd4GWDzIdEHmyKY8winUVje4
         RYLb3Qwe7qfAy/HeZ96Jv4a/y8wvjgohf8j1H0cDDH014o7m2eICNyAvZyFrFvm+iM0y
         TRD5BuZvFXomLPciqWOCMhu3IxfPgGix/UGWhV4TepBAYX+LT8tRcXymRsfLd56M54f7
         rw5MV7GW5xaa8DeW9LLI5JJCvcSsjNRVi8bhWQhVbzZtiYslVZF7v9XbDNSIzqg4LGmK
         JQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=kWNtg17y1dbyvtZ8kDz6YkHEIuVPqNEVgrQPBMKCYs4=;
        b=gNQn34Z8loKbNX6LDVFPXm7GAWPRCSCaQfe4kArb0SHHXiQk3/P9Psr7e5dPpMSthf
         FBF9n0yjhfyiiUS9eBgDBaoF8rLUdvugRNrWey07n2mj2fTIt1UeQyi6VHeVWNjnflad
         +vRvCw7d8OaKkvavtDZ3RbItFkTr8ja/H614SR8qJkLIrgz3rfGqoPI0L1fx5zW1IcEx
         XojH97WoaUtBIwOtWTtmQ6LspM0RJy39iElV0aAeJYX4TQ5R2VD8EKLVasAUxLlNjP6l
         2IJwl8WaPx8uJt5XeRDt2mW9pvqw5rY/YXKgRTaJsqoXEs/TIht8mYPHR7finbTyx0cB
         518Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="qv/9hWMM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e132si1481975ybe.763.2022.01.06.06.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jan 2022 06:49:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="qv/9hWMM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5U4i-0008L6-VX
	for alex.bennee@linaro.org; Thu, 06 Jan 2022 09:49:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5U4K-0008Iw-Hs
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 09:48:44 -0500
Received: from [2a00:1450:4864:20::42c] (port=36441
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5U4F-0004dO-Jp
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 09:48:40 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r17so5276212wrc.3
 for <qemu-arm@nongnu.org>; Thu, 06 Jan 2022 06:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kWNtg17y1dbyvtZ8kDz6YkHEIuVPqNEVgrQPBMKCYs4=;
 b=qv/9hWMMnA97jaLYHGxbA95PjxQ2dSKVp+Jms+ptNXNQHhF3oE5J9Wkw+LJV+ttlk3
 mXD95qXmwJ+4SEMAl0x5W+4mLx6Dxichw9CzO5QKvuLqTbyTHV5SSzv2/2GEyQgTiPeO
 eL7fMDB9Wz8R/GuM6rR8kHu075DKjlbJe6h0eM/Ce5AeKzyK8LAxEFXA6VbGxzym+bQy
 ApqtDafgmgHRiUnskNH2kES0XuWecrcz183BKdjSC+37cDfrUwe6BMI4LbI4uavu5fhj
 QZfr+tL5YOWC2kN3tDROVz+KcSnWRTsahPzc926wNzTMNCE+vaSEJ5SlqeNWXlnvyqgz
 pXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kWNtg17y1dbyvtZ8kDz6YkHEIuVPqNEVgrQPBMKCYs4=;
 b=DSpYJOSEzsTeItLQY95VhwHXqgdxXFUwg2fZtQyv6GCdNXwCINA4GUEK3KTDW6X4gN
 zAHAzG9pB6lOOxfzLgQ1sNW2V90GWWNMgHx0zcQk1CVG5/TiKSjAW2azEJJ0//Uksnvb
 fyzwg/R8uDRQGXFSZwdhGsQwarPu4lV41X6rKMC1NqOczNAPjCTx35TEC6X9jGd8LY4/
 9swimSPE+tYFJs5TQg9PUlt/a+ShGUHO118hyZk14C92xWFlqcCCkdCSBxn1n0QTdVHz
 zYkHHQGLYHgaP2GrwVcDn1xN21OOEq0zxrk+Zy2YTRRfognIS/Q/P1vPItrOlKiok3WW
 xLng==
X-Gm-Message-State: AOAM530WeShu620tJoELSHGv5qr3BxDYqNyurg/DYiPfFR77tZEk8V3+
 OpGyoMt6IYquBsWxBgU1fnjsl9cQaXbTIcw+c1/Qyw==
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr29627102wrv.521.1641480518284; 
 Thu, 06 Jan 2022 06:48:38 -0800 (PST)
MIME-Version: 1.0
References: <20211217233006.1466747-1-f4bug@amsat.org>
In-Reply-To: <20211217233006.1466747-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 14:48:27 +0000
Message-ID: <CAFEAcA-__Z06M-r9VhfkGh4QKxenFizcO+U+0EM+oPHJQho-Dg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] hw/net: Move MV88W8618 network device out of
 hw/arm/ directory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ePqshkA4Vba8

On Fri, 17 Dec 2021 at 23:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> This series simply extract the MV88W8618 device from the ARM
> machine in hw/arm/ and move it to hw/net/.
>
> Since v2:
> - declare MARVELL_88W8618 in hw/arm/Kconfig
> - use MARVELL_88W8618 Kconfig (rth)
>
> Since v1:
> - update (c) notice

Looks like the code-movement in this patchset has a clash with
your other series that's now in master that changed the signature
of dma_memory_read/dma_memory_write; could I ask you to respin,
please?

thanks
-- PMM

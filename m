Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2289376ejb;
        Mon, 29 Apr 2024 08:26:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYZ3dUyNugBG0tBjtWxFdAVA+gGkBtl7FW52o9HvOzMf2ZUD4acP6rs3/TMyKkKWPb9g4SC/zRMnmetLLsFUE/qi6AzJfD
X-Google-Smtp-Source: AGHT+IEsQSkSngw4/Q4clbYrpmvDeXlgxL7IMkpj4xD3L+M+bg+6gombrvv/YTwp0b1yiypQJQZS
X-Received: by 2002:a05:6808:193:b0:3c8:5e85:2640 with SMTP id w19-20020a056808019300b003c85e852640mr129258oic.59.1714404417647;
        Mon, 29 Apr 2024 08:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714404417; cv=none;
        d=google.com; s=arc-20160816;
        b=idFUdQ45qqgJ7RnWQlwSpUEIHf/+p54juwIN/bhdrw8cTXydkY7LwwSr1fpXaoO8lK
         C645ochi+Bm+xPaE99cEXtDSIBRnkEkx9nHfo4K0ke2p4FyXOwwh5kwYzxwPbS4EOFfM
         lpGwpZHBVoe+eIenej/x3gMWoPIOVHfwwJK60uZPcI7Yr5DZfbR5990bGUoJuqrsgLfl
         JrGzg5BeO2keNg682gvndBkN21753UoOM5K9R4zbTT0X1a8W7HPXH1/mZK20fuXWOz7o
         Ss7mF5T+i2C3Z7ZjR4o26j4GbCTIXKh3qvvJy0TBjIUv1NA0yxjwBvbpj36RS+BvvWhR
         kuFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7KIEhk+2oLby+p0StO8kmDFWHVzY4WuHElexMBXqQlw=;
        fh=NVn7ScDllHSS8Z7iuOG0CX/yjyrq+n3lEY9EmpzvkGQ=;
        b=uiwq1HJU9BGzygUaKs1Hth/w43KiufyJVaYnop5yefyQzXiTj0OcaYCb/pSD/hwSoP
         bZtWKx2HjvHf85++q1cgi8E3v2XQAqNJ/UNEte8l7hDJC8YhHh7ybm+euyHTzAHzP1R+
         XvNodAlFK5TQoyimRif6m1D4GkWHlapLHsl5xhcBnQeuo2lWC0Q1huPIICVt9jjAl/Oe
         Px9itPP5AyZss5L+adAFfICJaunDs/qHiIloBsaiZRIjzExjVmdzlnYsXaAAZ8pEHrDj
         N0L1yzc/8K1lAn+lOO9jc02H9PpxQ0l/mW691FwZnzFALCcNc+DNLwlx8rPaika5Ul49
         qFJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qVQ79h4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk30-20020a056214509e00b006a0a9dcb114si8670294qvb.202.2024.04.29.08.26.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2024 08:26:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qVQ79h4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1Str-0003tN-8x; Mon, 29 Apr 2024 11:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1Stp-0003t9-Vn
 for qemu-arm@nongnu.org; Mon, 29 Apr 2024 11:26:38 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1Sto-0006q5-77
 for qemu-arm@nongnu.org; Mon, 29 Apr 2024 11:26:37 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51bae805c56so5355641e87.0
 for <qemu-arm@nongnu.org>; Mon, 29 Apr 2024 08:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714404394; x=1715009194; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7KIEhk+2oLby+p0StO8kmDFWHVzY4WuHElexMBXqQlw=;
 b=qVQ79h4+Ti341YNwS7LZ85U7MPz5LxQeTti4B65VR6ezcg8Ogl3OwpoCqdypAP2DA5
 8JEtFJjHuzdYgurydhxUPnh8lLmdqxsY7OGu8baDT7WrXwe8dwjKblW0atWipfvkpegU
 sSdvcIsgbXhDgMGO9QEBVnSY8mZpY4P4r/7CeqVCGoPntUFSZTiiJdaPquPqDZFpSCBm
 kqdOD9f0wSFVDKZYA6Nh4MI92ne8bOfTepVcCA6ZXqwAw8JqPL6Wc6ps3tZCAf6RBsan
 6pGG1BHdymZwZU/o+e1gGAmb/ZQdfUyrD5/nZwnT4SIbMx/eUW7A8whPMMbSr8A8SxYG
 +2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714404394; x=1715009194;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7KIEhk+2oLby+p0StO8kmDFWHVzY4WuHElexMBXqQlw=;
 b=NiuCLrqL6QaKfHtwbJUKM0FzUjEmoxAHV4xKfrKJ4Qha7s1gbqmIyjqgsJJ2nruFe6
 JFI/RT2OsoPSufQJXLDs4Zmg7CMmZUKEYznUH6fIA0MC6lEOl3Ue/3h21LhfuLdRCvEE
 iUakmLAeL/WmR1Oh7QUJpjsMGsJ2X9WPooprp+7iI7fdLSvySkdpuCxiNI5fgDqqH4A6
 Cmtx/FaBcvJQ+2R1wsRqfPJ7bbZy17v2LYv6d1NCryQnuiKV2D8caWKNDvhputo5qliy
 gs35OuzYxjqUTFnW6arr0shcnPEX2u3KqVi8vQ3qN8zUsyAMx9YjHv+3OfWRE8LhNsi+
 ydrw==
X-Gm-Message-State: AOJu0YzH/98LpJYJHy40AuwbVKhpOtT6v/cepGksmMPVU15YeUiSpveN
 S6n4w9aK3iM/yItcZOZkmabxOpftLU9xw9o13fdD5DM3c+ixR3Z6zMbOOLCnPSxEu5zpn/hJ7yq
 j+/FhPKxJn1/p+sK0qsltIZa56vkATkefzWynYw==
X-Received: by 2002:a05:6512:368f:b0:51c:6c59:627e with SMTP id
 d15-20020a056512368f00b0051c6c59627emr5473168lfs.42.1714404393980; Mon, 29
 Apr 2024 08:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAH9tv=PKi3B44y4+gvTa9CpJHNN4UAeyvgxFwXCjUVM3Qy=ppA@mail.gmail.com>
In-Reply-To: <CAH9tv=PKi3B44y4+gvTa9CpJHNN4UAeyvgxFwXCjUVM3Qy=ppA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2024 16:26:22 +0100
Message-ID: <CAFEAcA_LH+vKxn3pdzfua_1+Piy4rQECq3yh66f_O+YuTxfnRw@mail.gmail.com>
Subject: Re: QNX in qemu
To: Krishna Gururaj <krishna125g@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3b6KahKPHv75

On Mon, 29 Apr 2024 at 13:26, Krishna Gururaj <krishna125g@gmail.com> wrote=
:
>
> Hello,
>
> I am trying to run the gles2-gears binary in qnx with the following confi=
guration :
>
> qemu-system-aarch64.exe -machine vexpress-a15 -cpu cortex-a57 -smp 4 -m 3=
0G -kernel ifs.bin -drive file=3Ddisk-qemu.vmdk,if=3Dnone,id=3Ddrv0 -device=
 virtio-blk-device,drive=3Ddrv0 -netdev tap,id=3Dmynet0,ifname=3DTAP_Ethern=
et,script=3Dno,downscript=3Dno -device virtio-net-device,netdev=3Dmynet0,ma=
c=3D52:55:00:d1:55:01 -device virtio-rng-device -nographic

This command line is not correct, because it takes a machine
that is only supposed to work with a Cortex-A15 ("vexpress-a15")
and tries to create a Cortex-A57 CPU with it. This will either
ignore the -cpu option or create something weird and unsupported,
I forget which. You should either fix the machine type or the
CPU type.

That's unrelated to your graphics question -- the answer there
is that you say "-nographic" which means "I don't want to see
a GUI window". If you do that then you obviously won't see any
graphics. (Beyond that, the guest OS will need to have support
for whatever graphics device/framebuffer the machine provides.)

thanks
-- PMM

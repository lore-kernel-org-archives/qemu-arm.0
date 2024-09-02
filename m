Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1033486njf;
        Mon, 2 Sep 2024 02:13:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmx6vnDg9KQE9+15Yoxq9L6zSkrVmQ3qHXh64KyhWx0FUiL9FLgjRSo3cYB6BbirsJAhr7V9Rl5lQQUg==@linaro.org
X-Google-Smtp-Source: AGHT+IGce4ZYcx8c+WoraHkPhgg+9ZyY+3MLo6KqYKUccO8qi0fukXW4aH1PYrTMGE7GMj/zymi/
X-Received: by 2002:a05:620a:1aaa:b0:79c:1178:dc9d with SMTP id af79cd13be357-7a812014bfemr1847027785a.24.1725268387856;
        Mon, 02 Sep 2024 02:13:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725268387; cv=none;
        d=google.com; s=arc-20160816;
        b=qknU1DX3ZDkms3SBgM5LDfb2GGEKBlxt5ViA/CfjYz0WBP9CaY63HSagndGqk5Y/ZZ
         7oJzuOeKy4YRhk3rc/wnA+APs/Y2o0RoQi+7ZglqFeVYpcce7jmDXUm5hgv4abhfLPfX
         oJoeP3kJ+b0k/fXZ4QfFh6HazNq3Qz4sleiF3SjZ/WECnQxyiOzi7xc1yHD5BM1BhEdY
         4XrsFXVZqUACJT9aa7zy4ZVkRf/TtsKtYI1b6+lbIqljEcuEEE7EuypaKQfK6Fo7E1eT
         cizLxwY2nYccmKTcPom/97dhUJjxYq9CO8zPFq9AmyzfVnYLthdYSP/kSXiG3cSzAQ0Y
         M2Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=o/K2Bv9bHfPtdNIbLycL2ceAE4QHQqe9VljKtdldOPU=;
        fh=4bP3KmM5f2bkyd+hXcmFP4uqxDe3cRFg9u0vbKmMt/E=;
        b=JiwQxqCzscIz/YuIIZwnc8JJF9R6XhkOajodj3foUhZ/YLmdosNSiZVJG+p/oIRKuI
         fuN8Z7HpfVaKXpPI6h3FQWo+xs2f1bJNxS1g1dDpIoVIuHWerKkTwQbN/Stf7HcQEl3c
         X5qN6cRKGb0m0QOzdWWyOOtcDfqnARUmf/a7+nEODpy2VXkNhGMFVON4ypbMs+hWSm7P
         Ji6eTHzRLbUYQWunpIbuC0Iw10KhB5Vb4IFDyugI6OXFHJbA0DSngYGrgBX7OZ6DYFRv
         Hul2K35GQ6V9P4rDiLD5OAkVFo/Yg3Iff2QPumc1cYuMXMSGI9xQtAewv47FaJpTKU/h
         xpDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CT2PRasx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806dd3b66si1031743485a.657.2024.09.02.02.13.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 02:13:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CT2PRasx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sl37M-00066x-PL; Mon, 02 Sep 2024 05:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sl37K-000666-Io
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 05:12:59 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sl37I-0007n9-N3
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 05:12:58 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c24c92f699so1577546a12.2
 for <qemu-arm@nongnu.org>; Mon, 02 Sep 2024 02:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725268374; x=1725873174; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o/K2Bv9bHfPtdNIbLycL2ceAE4QHQqe9VljKtdldOPU=;
 b=CT2PRasxGjdETeeJHa7R3T0vzsNkjkAjEHX3doOrpll9a0PZBI2Mncq6+T/KPJOtkH
 w5/mT5SYceJljpN9Aed6s3ERg60PVrH3WPpo/vb9BCyXz1Nty6zN+xXfCQF5MfKDdyJ7
 gXkjiH9SOA/3u/6e+sspjJXDuIvBoxX6DWpr+zs7G4JtTRZb8hwy1wBEu+NPqELC0rHW
 mzOs2oI8kK5zbnNxXWFoQWYVZ54L9TJGliXjmolAdORbUX6ywbuP6hbC5NYOJ3sELcDJ
 Ol51JcvRQi2aUkBcH2wzITyMpThPTgN46Yi+dHlM1lS+yGa0QDI6HWpqLfw03qJp5lbL
 xZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725268374; x=1725873174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o/K2Bv9bHfPtdNIbLycL2ceAE4QHQqe9VljKtdldOPU=;
 b=b8j3X+rjoJwJcNA/3idpU5laV+VdnQsvMiTwgoSMsBuKrqU2WMRqK3TdtExXfwDBPI
 BOszPopFauzRIx4xTNWL8d8AqYkHlcYHzvDy+z1hRjzafzBA5SbaeVciUMDAw1BPXYx8
 5nHNuRb5pZcm5gjD6hJJ4/NquFIm+ES1ViW95irFNY3cG9i92UD9nKFwLRWHqDV3IfYl
 tlDgjiVd6OBoAGx3+5iLxd/qSHG5xRlynBE/TZqESofU5NLAdGEgffmcSYgYsTGakjAZ
 yNcle/ZGq85G21hU4SYwfswZmFAHyp8aB6oalpr34vaH28x7T7IaU2VPkkklRzDh894g
 uyGA==
X-Gm-Message-State: AOJu0YxT5pElfBUIBU0/txQn0YrenqWPqiIi9V9bLS4rmVEF81B9f0sh
 F7fFL1jluO1c/xXWp3EttQbhomnM0FFD9fRPT7MaCsb9hLoV4mHLUlJhpKilkjKTsH+xIvN0UXn
 btwKoM5iRB5i0fvOevoJbdYSTPIPgThyppAOaRQ==
X-Received: by 2002:a05:6402:3551:b0:5c2:1298:3517 with SMTP id
 4fb4d7f45d1cf-5c21ed5523bmr8415176a12.20.1725268374255; Mon, 02 Sep 2024
 02:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_3E0F9F905031BE780D8EB329DA00C7EDFA0A@qq.com>
 <CAFEAcA9zizTZ-qtvEf31eDYj9ognKHpaSkM6OsJxug-_e1JE5Q@mail.gmail.com>
 <tencent_72A38157DF7887E22DF0DAEED9B009892C06@qq.com>
In-Reply-To: <tencent_72A38157DF7887E22DF0DAEED9B009892C06@qq.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Sep 2024 10:12:43 +0100
Message-ID: <CAFEAcA9EL6n7H4QWijje2gDtT9JmpEnkvXD_DJjg4o0eE75jVA@mail.gmail.com>
Subject: Re: Troubleshooting Data Abort Error While Debugging U-Boot on
 mcimx6ul-evk in QEMU
To: Guy <guyqqcom@qq.com>
Cc: qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: mQ54XcWB86E/

On Mon, 2 Sept 2024 at 07:10, Guy <guyqqcom@qq.com> wrote:
>
> When I attempt to run U-Boot and debug it with GDB, I encounter an issue =
in the get_cpu_rev function:
>
> struct scu_regs *scu =3D (struct scu_regs *)SCU_BASE_ADDR;
> cfg =3D readl(&scu->config) & 3;
>
> This triggers a data_abort error. The log displays
>
> ----------------
> IN: get_cpu_rev
> 0x87802786:
> OBJD-T: 5968
> Invalid read at addr 0xA00004, size 4, region '(null)', reason: rejected
> ----------------

The problem here is that the guest code thinks it can read
from this address, and QEMU thinks there is no device there.
To figure out which one is wrong, you need to look at the
data sheet for the SoC to see whether it says there's
anything at that address.

> Furthermore, I also tested a precompiled qemu-system-arm.exe in windows (=
the -version command shows the same 7.2.0 version of QEMU, although I'm not=
 sure if there were any differences in the compilation process) to debug th=
e same U-Boot code, and I did not encounter the data_abort error at the get=
_cpu_rev step. The log displays
>
> ----------------
> IN: get_cpu_rev
> 0x87802786:
> OBJD-T: 5968
> scu: unimplemented device read  (size 4, offset 0x0004)
> ----------------

I think these can't be the same versions of QEMU. This second
one seems to have been patched to treat this area of memory
as "there should be a device here, but we don't implement it,
so warn about it but return 0". Where does this one come from?

thanks
-- PMM

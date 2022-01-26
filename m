Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp3506803lfk;
        Wed, 26 Jan 2022 09:26:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZCm/LjvY7pNyqyUqIYCpVCKHelaTXuCN3kZtNTmiFKKJYJUb9ELdADBBDkNhVOsa3IzOh
X-Received: by 2002:a5b:a4c:: with SMTP id z12mr37096328ybq.490.1643217964085;
        Wed, 26 Jan 2022 09:26:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643217964; cv=none;
        d=google.com; s=arc-20160816;
        b=OCQuZJFzcLZFX+NhP9YBwvtO9+9PafpLnjLdysDeBmTQB950vkckw+ki7wZd2N4jVg
         ZUgUgqdGd+tH1iTSWAoScZBk53EMIS4kSMIReFiv201APxKiPAPdEySLeuoIlYoScufT
         yMaX0C1n+dpI03S9xXV8gwajvu3VGUX84qGWaXkwrIf7rYm9w8DbuxUZ5YlLvnsCD5yQ
         AeLPQOJwXlNP8b1M31OagHkN8Ke+mqjup02NoEnBSBkSrdiD7WO9GQd1YEStsFB6BJXW
         qn7zzsEAY7u/lGB251b8BSa8+9NtSOoWJaK85SI5a0hce7ksnYCahpkm1GGMOaZvmcSb
         4cOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hsdGbdu5V8Ys7NMt9/YC8yj7jkKzQkF/kbpU0Z5TFyI=;
        b=XuCOALLr4GnICgFNFcL9Z4SqjhF9Fs6BRJSpOGr202ezqzJiCvhP47XguO38s41lBD
         2LH4JBNbYT9TKWTKwbdSkmS2c29LjArdsUhCG5Iphmlpzgqzf85b7ghrGHKu99fc/T5Y
         cZHuH7pwLWSg2IaDwf80uAylQoa2xr71gc6OJmb4Yn+EWpfO/yeyuS8bcg5JUJeHAE+i
         2Xfkya1QcVm6vVCBMBnrFL2zqMnG55I9qY5zZoCbSiKsrATRWjyT8DPJ9SZlH/HtPuh0
         a7m6Qh6ibYSAXiB75swiZXwGdfDOQgx9unMHCsu9DgAeVYmHM/FWxaqEGKrtjgSZztDP
         U5Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=EQ+fgYrm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s78si22176339ybs.521.2022.01.26.09.26.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jan 2022 09:26:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=EQ+fgYrm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nCm3X-0003Eq-Du
	for alex.bennee@linaro.org; Wed, 26 Jan 2022 12:26:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crauer@google.com>) id 1nClqx-0004OB-Dw
 for qemu-arm@nongnu.org; Wed, 26 Jan 2022 12:13:03 -0500
Received: from [2a00:1450:4864:20::236] (port=35337
 helo=mail-lj1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <crauer@google.com>) id 1nClqv-0001V5-Hy
 for qemu-arm@nongnu.org; Wed, 26 Jan 2022 12:13:02 -0500
Received: by mail-lj1-x236.google.com with SMTP id q127so583956ljq.2
 for <qemu-arm@nongnu.org>; Wed, 26 Jan 2022 09:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hsdGbdu5V8Ys7NMt9/YC8yj7jkKzQkF/kbpU0Z5TFyI=;
 b=EQ+fgYrmVeWHKXuenMjnmHSn5gG14Ir/EhBYTvXnDICUzZWm3jIhSEJlw9J4Hxba05
 kt0EeUQtlmois3AjJjPO3z7uFnH+e95LIH7R7yGfnwME47i/r7jfiE6yEU4Bg+b/Vnws
 kOhMTZS0C20IwJXsTfIK/Zs9rCw0QsJETG/K060a3LX5RPvvxjVVMmToyRsLG2W94IMf
 Ad3IjTh0jTjQ5LmUhAZZut50Xy0So6ONlQYF8PROSgfFN3arDNGFSMj3FkXH8W4q1+LD
 m+vVTrAQ5bwKpMVvuAZ5crzYcG0EdQ2+oRPnBe/IpEjwATVNzOedjjeYaG+ZTen7AGdq
 E8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hsdGbdu5V8Ys7NMt9/YC8yj7jkKzQkF/kbpU0Z5TFyI=;
 b=59uhEksxmq0N7kDQw/mE6q9VkYFsDN7hqMNtSGC103sM7G5dErSgdGSr9D2fu5WTIG
 /lmvPJ4QxxaoB2fyxxP+R+DzywkCc2mJYuTlKxNmAEyl3DmgSVEtQ0m7bZ2ZmQOrnsdZ
 ZI8xIEEJ5pyxt54xl9hogbslMct6557HS9UbZGd/urtSZYTdvDGdYMCaT8ptq6EuxakQ
 K+rajgPkIPyo365EKyOcYxe9G37R6onFbWn49t16P1gDsQEcLxIyauc3BzsupOUQKDlp
 rfUjZLU0gxCjQLydXmDPt9zQydjYlbTPCC/v1arlmStFukvjNWXsW6Mz1qLRo8aZOBsr
 42tA==
X-Gm-Message-State: AOAM530bdLisQFaca8s/vvjDcGU6metIE21WVRRKVRmLHcT/CGFp4kUt
 N/NpZdNo0b975bFTC4SJnHbnfNIkMs6DvmVTdIK3dg==
X-Received: by 2002:a2e:9801:: with SMTP id a1mr3516487ljj.369.1643217158606; 
 Wed, 26 Jan 2022 09:12:38 -0800 (PST)
MIME-Version: 1.0
References: <20220110214755.810343-1-venture@google.com>
 <CAFEAcA8Bki2dpyptkSibz5=t9Fvy-PN8SjD=Z0PwcssX3MprRA@mail.gmail.com>
 <CAFEAcA_OfpMLzG=eUuzw0O_V_cgb57=XADciyfiF7U1mK0FzxQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_OfpMLzG=eUuzw0O_V_cgb57=XADciyfiF7U1mK0FzxQ@mail.gmail.com>
From: Chris Rauer <crauer@google.com>
Date: Wed, 26 Jan 2022 09:12:27 -0800
Message-ID: <CAFtMCFUbBhXMxtc7RN+3OhDtckB+x-HXWbWcmh8AyncnriNFxQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Adds designware i2c module and adds it to virt arm
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Patrick Venture <venture@google.com>, mst@redhat.com, imammedo@redhat.com, 
 ani@anisinha.ca, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000007ddd505d67f4f97"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::236
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=crauer@google.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UiCtDQk1uoYM

--00000000000007ddd505d67f4f97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>I need to see a pretty strong justification for why we should be adding
new kinds of devices to the virt machine,
The designware i2c controller is a very common controller on many ARM
SoCs.  It has device tree bindings and ACPI bindings which makes it ideal
for this platform.

>Forgot to mention, but my prefered approach for providing
>an i2c controller on the virt board would be to have a
>PCI i2c controller: that way users who do need it can plug it
>in with a -device command line option, and users who don't
>need it never have to worry about it.
The device is enabled by a machine parameter, =E2=80=9C-machine virt,smbus=
=3Dtrue=E2=80=9D,
and is disabled by default.

> (We seem to have an ICH9-SMB PCI device already; I have no idea if it's
suitable.)
I didn't find that device suitable because it is part of the Intel
Southbridge, which may have some Intel platform quirks, and we don't need
all the things in that IO hub.

-Chris

--00000000000007ddd505d67f4f97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;I need to see a pretty strong justification for why we=
 should be adding new kinds of devices to the virt machine,<br>The designwa=
re i2c controller is a very common controller on many ARM SoCs.=C2=A0 It ha=
s device tree bindings and ACPI bindings which makes it ideal for this plat=
form.<br><br>&gt;Forgot to mention, but my prefered approach for providing<=
br>&gt;an i2c controller on the virt board would be to have a<br>&gt;PCI i2=
c controller: that way users who do need it can plug it<br>&gt;in with a -d=
evice command line option, and users who don&#39;t<br>&gt;need it never hav=
e to worry about it. <br>The device is enabled by a machine parameter, =E2=
=80=9C-machine virt,smbus=3Dtrue=E2=80=9D, and is disabled by default.<br><=
br>&gt; (We seem to have an ICH9-SMB PCI device already; I have no idea if =
it&#39;s suitable.)<br>I didn&#39;t find that device suitable because it is=
 part of the Intel Southbridge, which may have some Intel platform quirks, =
and we don&#39;t need all the things in that IO hub.<br><br>-Chris<br></div=
>

--00000000000007ddd505d67f4f97--

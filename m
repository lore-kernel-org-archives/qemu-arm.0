Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp1481360njb;
        Sat, 21 Sep 2024 12:36:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZiFDs3Ijn6RRHp8fj4QxClehr1vutTIICnwLhgnhj13hl947sC2FFcrwkOQFFv8SOa5jhCQA/YSYbMg==@linaro.org
X-Google-Smtp-Source: AGHT+IEvGNBqLzbv3O2ljOK8z5D7jPbnh5I2ymFBAjU7mzUjFQVJsKIWULDgSMtTVi57+J7xg+vo
X-Received: by 2002:a05:6214:4589:b0:6c5:2fc7:a626 with SMTP id 6a1803df08f44-6c7bc746b22mr107008946d6.34.1726947390356;
        Sat, 21 Sep 2024 12:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726947390; cv=none;
        d=google.com; s=arc-20240605;
        b=TvqEOjWapJxxNC1AKpSYVGdpXfKckfcOIVlgpotuxa3FG09Rv7yl2VgiaMuQzpT2Qv
         Z3rFveC6GgZoPs9NAINGAda7QYXItpNGIdVHF9gH9WpttgpKjzd7W/hgqBnAhuuxEp4K
         JHllL4N/RLpkwhKkiLrmux+lXZJ+drVa+p+OT27wIHYcf/wycJU5Yk7MdrRJIdb7ibol
         kGyaHE6mEBNgQIL4qVH6rL6LK1uhf4mE3SbzCHpEX91HashT2AeNnK/osPRf2JTjgnBI
         VqgZizkL2HRn6qaLM6NrcMtu8oW1DESz4D4iFd3oqADIWqUHMYxaWCnchhXU5GT1eEAe
         dKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=E8LFyP1seF1KlJDE/l6XVbrZ2rFN6UCOfREcWb7U+SM=;
        fh=JJ+m4CkYpKb9HNCE26j4wl691CDbBF/VBwrBG0RIfyo=;
        b=dP1i1wknkeHUn8mvkVmYdIquplzIHhIpXDLwhkYKE3MEep2As1EQFvSEjysT6J6lmy
         Wmfl7DtAs2wE9bYVAE4+1KtK6XYLd+joSa34i145boT11Aomb9DwydkRi4/W3fVM/OUC
         mxoqChtxN76u4TLn7oA5k4LbdaCNBDkrytEOwbb1cF7MayCHJzO48NvJZFLYn3rI61mf
         AxWJEVWqOZ3BdlyXpV4EaPKAH3B6hyAHM/7D/NGjMpbuKyDA93MEeRFJRvKhfQbB2OZf
         QC5qb56xUGUQ4atC2lqiAiPC+tfbMxRUdUnRM6aPiA7zlyS8AErZvNzgd65TyOrlDyW8
         kRZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ga8iQ1Ni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e456639si71040276d6.50.2024.09.21.12.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Sep 2024 12:36:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ga8iQ1Ni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ss5tt-0006XD-LQ; Sat, 21 Sep 2024 15:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1ss5tr-0006VR-Qs; Sat, 21 Sep 2024 15:36:11 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1ss5tq-0003OF-80; Sat, 21 Sep 2024 15:36:11 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-20551eeba95so28267575ad.2; 
 Sat, 21 Sep 2024 12:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726947367; x=1727552167; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=E8LFyP1seF1KlJDE/l6XVbrZ2rFN6UCOfREcWb7U+SM=;
 b=ga8iQ1Ni77TrrybWL6hgIzSBXp27o4CNgOgdLE8mjc6rqYqX7srmPhd5oraxx8ALf4
 wZBjFjWuoQhvVENpce+SYSBI9RTgAr84GbYGqLUYVkdwiaBmEiaqJn7T8FVl+UfJNmsB
 fxDUWHx7uG1aij1T9oDt4xgFO4G1eYGLk/iJG3UO8bzQKtBCOWnQXKYcuJV5CIoKpWPs
 rteqTJxNTcWmrUXaRWPXnWI55/MmFLD3SrqYkZhprCCzG+zY7chMWJUmMjTgOyC+a18Q
 iU0eaMabdTWOonpyfW4PsZcjVzSc74JbXEjJwF59PE+8A7T5SVy3JziiKIXi5BRIaARv
 h6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726947367; x=1727552167;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E8LFyP1seF1KlJDE/l6XVbrZ2rFN6UCOfREcWb7U+SM=;
 b=OBy+DtWAF0Fd6u9lfTtmK2Vs/bRVM0uftjxchLE7cTBUDwyIO29O9RfuREe+defw+S
 9USWHlqkJLlz6jDUsIGlb/evH3UVRPO5e/V91fq5EK8QTBmeyfp2a5IxQHCUQO79tK4F
 jY4Bx1svjPpPxJMzH2ZJKE2IE2Oc1FHPtyPxPXvgpnT38rbF8aGop4VhPrFh1170NyID
 DkGs0kJPmEYn15oynheXQ25913WC0mEaZ0DkyKRC00suhXs8VJmzw0qXxuueEcPHebtz
 eYW0VPZyWOq+Uj6vsC6bPrpoz0eLxFa5dek1WKIay7z2bmaaEURmfY1taLCxMDYyO1yr
 bUmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5wLWL/bdAlp4hBbdkpQEKVZU34nNg9KE66hopu/6lZVNjCpBjSpi6NeCOY8v/UGOpS9Nh48hLNqpPLAc=@nongnu.org
X-Gm-Message-State: AOJu0YyQ/TpMhyjZ5YB4BO01OUSX/6OWm8ERsHiujCPhaBdG+FSkCVGN
 2OYLd94dfImdECiEwqhT31su1qIj98q3s6sGu5XddmKFfY9vuyg6eG6x+h2EPA2kiSvIRbPSp+M
 5fkCZ1o/sRQ3HqHjnjOmWDmK4iYYOr6MPt84=
X-Received: by 2002:a17:903:41cc:b0:206:64b4:3088 with SMTP id
 d9443c01a7336-208d83cda24mr100777975ad.29.1726947366822; Sat, 21 Sep 2024
 12:36:06 -0700 (PDT)
MIME-Version: 1.0
From: Mario Marietto <marietto2008@gmail.com>
Date: Sat, 21 Sep 2024 21:35:30 +0200
Message-ID: <CA+1FSihZ4-W+ksXwu6UHaWqOb6tpud7WEyknekJ1TmZQWPZ42Q@mail.gmail.com>
Subject: How to enable KVM nesting virtualization on the Jetson nano.
To: qemu-arm <qemu-arm@nongnu.org>, qemu-discuss@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>, virt-tools-list@redhat.com,
 libvirt-users@redhat.com
Content-Type: multipart/alternative; boundary="000000000000586c910622a6445e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=marietto2008@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
X-TUID: WsdSRca8N/jk

--000000000000586c910622a6445e
Content-Type: text/plain; charset="UTF-8"

Hello to everyone.

while I was looking for a way to enable the nesting virtualization on my
Jetson nano,after having enabled KVM applying these patches :

https://github.com/OE4T/linux-tegra-4.9/blob/oe4t-patches-l4t-r37.4/
<https://github.com/OE4T/linux-tegra-4.9/blob/oe4t-patches-l4t-r32.4/arch/arm64/configs/tegra_defconfig>

When I have googled for acquiring more informations,I found these
interesting threads :

https://patches.linaro.org/project/qemu-devel/patch/b7c2626e6c720ccc43e57197dff3dac72d613640.1616052890.git.haibo.xu@linaro.org/

https://superuser.com/questions/1838383/arm-cpu-nested-virtualization-how-can-i-make-vcpu-start-from-el2

On the first site,he says :


> can be enabled by "-M virt,accel=kvm,virtualization=on" when starting a VM

Good,I could try,but I'm not using qemu directly (I've installed qemu
vers. 9) ,but
virt-manager version 4.0. Maybe I should upgrade it ?

In virt-manager I don't see how I can specify those parameters.
Anyway I'm not sure that it will work,because on the second thread he said to :

-append "kvm-arm.mode=nested" \


Where is the truth ?

Very thanks.

-- 
Mario.

--000000000000586c910622a6445e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello to everyone.<br></div><div><br></div><div>while
 I was looking for a way to enable the nesting virtualization on my=20
Jetson nano,after having enabled KVM applying these patches :</div><div><br=
></div><div><a href=3D"https://github.com/OE4T/linux-tegra-4.9/blob/oe4t-pa=
tches-l4t-r32.4/arch/arm64/configs/tegra_defconfig" rel=3D"nofollow norefer=
rer" target=3D"_blank">https://github.com/OE4T/linux-tegra-4.9/blob/oe4t-pa=
tches-l4t-r37.4/</a> </div><div><br></div><div>When I have googled for acqu=
iring more informations,I found these interesting threads :</div><div><br><=
/div><div><a href=3D"https://patches.linaro.org/project/qemu-devel/patch/b7=
c2626e6c720ccc43e57197dff3dac72d613640.1616052890.git.haibo.xu@linaro.org/"=
 target=3D"_blank">https://patches.linaro.org/project/qemu-devel/patch/b7c2=
626e6c720ccc43e57197dff3dac72d613640.1616052890.git.haibo.xu@linaro.org/</a=
></div><div><br></div><div><a href=3D"https://superuser.com/questions/18383=
83/arm-cpu-nested-virtualization-how-can-i-make-vcpu-start-from-el2" target=
=3D"_blank">https://superuser.com/questions/1838383/arm-cpu-nested-virtuali=
zation-how-can-i-make-vcpu-start-from-el2</a></div><div><br></div><div>On t=
he first site,he says :<br></div><div><pre><span><br>&gt; can be enabled by=
 &quot;-M virt,accel=3Dkvm,virtualization=3Don&quot; when starting a VM<br>=
<br></span></pre><pre><span style=3D"font-family:arial,sans-serif">Good,I c=
ould try,but I&#39;m not using qemu directly (I&#39;ve installed qemu vers.=
 9) ,but <br>virt-manager version 4.0. Maybe I should upgrade it ?<br><br>I=
n virt-manager I don&#39;t see how I can specify those parameters. <br>Anyw=
ay I&#39;m not sure that it will work,because on the second thread he said =
to :<br><br></span><code>-append <span>&quot;kvm-arm.mode=3Dnested&quot;</s=
pan> \</code><br><span style=3D"font-family:arial,sans-serif"></span></pre>=
<pre><span style=3D"font-family:arial,sans-serif"><br>Where is the truth ? =
<br><br>Very thanks.</span></pre></div><span class=3D"gmail_signature_prefi=
x">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature">Mario.<br></div></div>

--000000000000586c910622a6445e--

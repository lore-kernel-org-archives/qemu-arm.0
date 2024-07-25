Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp179372njb;
        Thu, 25 Jul 2024 18:01:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhMVMEK1edSaLFYFH5ryseCBXixdqPE/zI4d8G+aG79mT7M/v+NWSy3T91gmZZVJl+wLH5v1MHxCjZMAsy8ss7IJCC6Pky
X-Google-Smtp-Source: AGHT+IFZwtdsix/37LBtRY9b9JFbhFyFNQlQjc/xi2OoMN/YB1a4mTUuJnwMAVXQFHAAkul80qml
X-Received: by 2002:a05:6102:158e:b0:48f:b592:bb2b with SMTP id ada2fe7eead31-493d640fdd6mr6063240137.10.1721955690815;
        Thu, 25 Jul 2024 18:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721955690; cv=none;
        d=google.com; s=arc-20160816;
        b=vz/oLlfDTmWtOFB0mRHQ2Drj0qtR4n5Mkl6wT2Py4kGepEbG+cpS4mcnt7n2P4r2i0
         mfwD1Mb/2uYTvDNkM2DRrvfEWQMCb1yT0G+KafpcHzwGZeamzNoLSUvRhnkG+xOYV86E
         cdH9NwKc6oZCvrFXeZ7oUKe49+abTE13u+mB+i+JaV9o7qrz+RPgCoSIBtpdvqOATj1q
         QR8D2tyvGmp9n0oA4Sg3FhRt8tXj6VaWeMQjZbADSK8h47ix1ZbgBH1RDnNutdCi85ot
         Cw+lHBXeK8eql/l+atfGbTXdZsZEo2TG2nZ6RdhhA7S9FdwUWma7LTeGhu/0aqO331by
         iTPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=aNtfCyuc/ufrl8ApLB2QmjYX5IWqYEFRKb2DRrkTMMU=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=oYn3mWCmDRELWnIvKr4GLbGusYsuotOaDQlB45eTgeaVrC4ttK92VT/k6Z0tOCrEG3
         jJOhCCm56CX91rYFML3eXJmhL3baKBplx9bb8n8NsO6+HnoMpfFCABx5aAVM/h/Mrong
         OrDic6wdMKSga8kkQnfL9ESP/CzfTTcBPHOkKorT5zKXbmyUjEmngrFbPf4Nc8/ev3NX
         o9LnOc738EAhEoG5BdgkyR7Vx836hNnBouYgX3qfgWJWwvk08zKZ5Xl+CoYxzkaB+DMh
         ACwS5uojUucHfpqf6sm/m+mJVIJ29kOk9FobvieefkrPU1IbW2lkVaiB91kY9qF3wnZc
         jmNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=KkqCu5z2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-493d991a34fsi709288137.820.2024.07.25.18.01.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2024 18:01:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=KkqCu5z2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sX9KW-000274-El; Thu, 25 Jul 2024 21:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonas.c.noll@gmail.com>)
 id 1sX4qO-00032g-Tj
 for qemu-arm@nongnu.org; Thu, 25 Jul 2024 16:13:45 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jonas.c.noll@gmail.com>)
 id 1sX4qN-0006Nh-3q
 for qemu-arm@nongnu.org; Thu, 25 Jul 2024 16:13:44 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-664ccd158b0so11823257b3.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2024 13:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721938421; x=1722543221; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=aNtfCyuc/ufrl8ApLB2QmjYX5IWqYEFRKb2DRrkTMMU=;
 b=KkqCu5z2c/cdPlM91IS3r54gOS4Ow2SVFn/wXU1ulWeN6lQWhBlFrQzSoNxSpFtfrD
 kE5b0gm47bDX/xYdbNVjzl0Q9bESJ4ZNrdKQlRXO+pt2aC1YsX+/wMbGI+Tzm3/5/KqG
 v4mf8O5Nl19ZjegTOWymWIj5INkvVJ6zRTJ/IvMCgiko6ZBuBtQve9zSemU7mWDVHnBh
 mfnXzUjyVwp2D75fyhZJ2UURVMGf4N1ZrQjx3D7aer6ktlvCD6NGxGx7F3zJJOCOVrH4
 kG4nq5kWPmkkTBRJkMQlh43rhIyLNqCA/eQrQXQfp3hswwRolwiDKWRoqb17aYIjRWU2
 OIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721938421; x=1722543221;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aNtfCyuc/ufrl8ApLB2QmjYX5IWqYEFRKb2DRrkTMMU=;
 b=cCv7QOOhxzbpoqoo5hebwThiw6DZmCVhYXrejyKEhZ5R6fW3ox9NkJZmmeQEZFtWrt
 Q7SsmrBkMd/gXcTOz2M3Jtz5w1sc0fK6fUntuNd/ZWCp/dIAPks143ezbtsEDGHGR+dT
 KQRPPbartETCyJd3STIoFXmz/BzjhaOKWTTPpFDXX+RiufZgHiKS9j1PdizLNtIEralZ
 l16DtrGWtBxurG3gJq7DolldGYfaNOnB9roZeloYCGIzDfoqDrz7v9VeNEngujwF9MOS
 yyNmxiYeQT6SlvScO0Pa0oRDOhcRIqL28NpkGPP0kJKGvJlFZL778wys1KvRf0HNG8E9
 Kitg==
X-Gm-Message-State: AOJu0Ywws9HXjTRQH5skUiM+HHG8k6KCj+of+u5unSikiwyf3n+R3vFj
 1SzeZ4Ubd84R3YoQtE3EQtPICGkeLx7HqxudvBiUKugTJDtWGOO1yWy69u+UwR4b9t9txQWYXp/
 aosY/tvBsJkAn46Oi4NnCNC2FZUMm9ZQYe3I=
X-Received: by 2002:a0d:ea0e:0:b0:673:b39a:92f0 with SMTP id
 00721157ae682-6751187e8b8mr42457287b3.11.1721938421521; Thu, 25 Jul 2024
 13:13:41 -0700 (PDT)
MIME-Version: 1.0
From: Jonas Noll <jonas.c.noll@gmail.com>
Date: Thu, 25 Jul 2024 16:13:30 -0400
Message-ID: <CAETw2qO29JpKUeqAEzWEu-hNyYG4sB2wfiQA1nD6a8TC9YX7iw@mail.gmail.com>
Subject: Running qemu-system-aarch64 with KVM support on a dual-booting
 android device
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f0a72d061e180702"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=jonas.c.noll@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 25 Jul 2024 21:01:07 -0400
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
X-TUID: Io+oE5te4JDy

--000000000000f0a72d061e180702
Content-Type: text/plain; charset="UTF-8"

Hello.

I'm running into the following issue:

> $ ./run_vm_kvm.sh
> *qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0):
> Invalid argument*
>
but sometimes this issue:

> $ ./run_vm_kvm.sh
> *qemu-system-aarch64: error creating in-kernel ITS: No such device*


I'm currently trying to run a windows 11 for arm VM on a Cosmo Communicator
(an android phone that allows dual booting Debian Linux)
It runs a helios p70 with cortex-a53 small cores and cortex-a73 big cores
and from what I can see KVM and GIC-V3 are both supported by the kernel:
KVM:

> $ zcat /proc/config.gz | grep KVM

CONFIG_HAVE_KVM_IRQFD=y
> CONFIG_HAVE_KVM_EVENTFD=y
> CONFIG_KVM_MMIO=y
> CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
> CONFIG_KVM_VFIO=y
> CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL=y
> CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
> CONFIG_KVM_COMPAT=y
> CONFIG_KVM_ARM_VGIC_V3=y
> CONFIG_KVM=y
> CONFIG_KVM_ARM_HOST=y

GIC:

> $ zcat /proc/config.gz | grep GIC

CONFIG_MTK_GIC_EXT=y
> CONFIG_MTK_GIC_V3_EXT=y
> # CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
> # CONFIG_HID_UCLOGIC is not set
> CONFIG_HID_MAGICMOUSE=y
> CONFIG_ARM_GIC=y
> CONFIG_ARM_GIC_V3=y
> CONFIG_KVM_ARM_VGIC_V3=y
> CONFIG_MAGIC_SYSRQ=y
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1

That being said my Kernel version is pretty old because from my
understanding it's shared with the android installation:

> $ uname -r

4.4.146


I've compiled Qemu 9.0.2 for my system in the hope it would give me better
luck and it's definitely functioning better without KVM but KVM is still
not working. This is my Qemu command:

> cat run_vm_kvm.sh
> ~/qemu/qemu-9.0.2/build/qemu-system-aarch64 \
>     -machine type=virt,accel=kvm,gic-version=host \
>     -cpu host \
>     -m 2G \
>     -smp 2 \
>     -bios /home/cosmo/qemu/qemu-9.0.2/build/pc-bios/edk2-aarch64-code.fd \
>     -device ramfb \
>     -device qemu-xhci \
>     -device usb-kbd \
>     -device usb-tablet \
>     -drive
> file=/home/cosmo/Downloads/Win11Arm.VHDX,format=vhdx,if=none,id=boot \
>     -device usb-storage,drive=boot,serial=boot \
>     -drive
> file=/home/cosmo/Downloads/virtio-win.iso,media=cdrom,if=none,id=iso \
>     -device usb-storage,drive=iso \
>     -nic user,model=virtio-net-pci,mac=**:**:**:**:**:** \
>     -vnc :0 \
>     -d int,cpu_reset,strace
>

Does anyone have any ideas?

--000000000000f0a72d061e180702
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hello.<br><br></div><div>I&#39;m runni=
ng into the following issue:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">$ ./run_vm_kvm.sh<br><b>qemu-system-aarch64: kvm_init_vcpu: kvm_arch=
_init_vcpu failed (0): Invalid argument</b><br></blockquote><div>but someti=
mes this issue:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">$ ./ru=
n_vm_kvm.sh<br><b>qemu-system-aarch64: error creating in-kernel ITS: No suc=
h device</b></blockquote> </div></div><div><br></div>I&#39;m currently tryi=
ng to run a windows 11 for arm VM on a Cosmo Communicator (an android phone=
 that allows dual booting Debian Linux)<br></div>It runs a helios p70 with =
cortex-a53 small cores and cortex-a73 big cores and from what I can see KVM=
 and GIC-V3 are both supported by the kernel:<br><div>KVM: <br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">$ zcat /proc/config.gz | grep K=
VM</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">CONFIG_HAV=
E_KVM_IRQFD=3Dy<br>CONFIG_HAVE_KVM_EVENTFD=3Dy<br>CONFIG_KVM_MMIO=3Dy<br>CO=
NFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=3Dy<br>CONFIG_KVM_VFIO=3Dy<br>CONFIG_HAVE=
_KVM_ARCH_TLB_FLUSH_ALL=3Dy<br>CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=3Dy=
<br>CONFIG_KVM_COMPAT=3Dy<br>CONFIG_KVM_ARM_VGIC_V3=3Dy<br>CONFIG_KVM=3Dy<b=
r>CONFIG_KVM_ARM_HOST=3Dy</blockquote><div>GIC: <br></div></div><div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">$ zcat /proc/config.gz | grep G=
IC</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">CONFIG_MTK=
_GIC_EXT=3Dy<br>CONFIG_MTK_GIC_V3_EXT=3Dy<br># CONFIG_SERIAL_CONEXANT_DIGIC=
OLOR is not set<br># CONFIG_HID_UCLOGIC is not set<br>CONFIG_HID_MAGICMOUSE=
=3Dy<br>CONFIG_ARM_GIC=3Dy<br>CONFIG_ARM_GIC_V3=3Dy<br>CONFIG_KVM_ARM_VGIC_=
V3=3Dy<br>CONFIG_MAGIC_SYSRQ=3Dy<br>CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1=
</blockquote></div><div>That being said my Kernel version is pretty old bec=
ause from my understanding it&#39;s shared with the android installation:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">$ uname -r</blockquote>=
</div><blockquote style=3D"margin-left:40px">4.4.146<br></blockquote><br></=
div><div>I&#39;ve compiled Qemu 9.0.2 for my system in the hope it would gi=
ve me better luck and it&#39;s definitely functioning better without KVM bu=
t KVM is still not working. This is my Qemu command:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">cat run_vm_kvm.sh<br>~/qemu/qemu-9.0.2/bui=
ld/qemu-system-aarch64 \<br>=C2=A0 =C2=A0 -machine type=3Dvirt,accel=3Dkvm,=
gic-version=3Dhost \<br>=C2=A0 =C2=A0 -cpu host \<br>=C2=A0 =C2=A0 -m 2G \<=
br>=C2=A0 =C2=A0 -smp 2 \<br>=C2=A0 =C2=A0 -bios /home/cosmo/qemu/qemu-9.0.=
2/build/pc-bios/edk2-aarch64-code.fd \<br>=C2=A0 =C2=A0 -device ramfb \<br>=
=C2=A0 =C2=A0 -device qemu-xhci \<br>=C2=A0 =C2=A0 -device usb-kbd \<br>=C2=
=A0 =C2=A0 -device usb-tablet \<br>=C2=A0 =C2=A0 -drive file=3D/home/cosmo/=
Downloads/Win11Arm.VHDX,format=3Dvhdx,if=3Dnone,id=3Dboot \<br>=C2=A0 =C2=
=A0 -device usb-storage,drive=3Dboot,serial=3Dboot \<br>=C2=A0 =C2=A0 -driv=
e file=3D/home/cosmo/Downloads/virtio-win.iso,media=3Dcdrom,if=3Dnone,id=3D=
iso \<br>=C2=A0 =C2=A0 -device usb-storage,drive=3Diso \<br>=C2=A0 =C2=A0 -=
nic user,model=3Dvirtio-net-pci,mac=3D**:**:**:**:**:** \<br>=C2=A0 =C2=A0 =
-vnc :0 \<br>=C2=A0 =C2=A0 -d int,cpu_reset,strace<br></blockquote><div><br=
></div><div>Does anyone have any ideas? <br></div></div><div><div><div><div=
><div><div><br></div></div></div></div></div></div></div>

--000000000000f0a72d061e180702--

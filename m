Received: by 10.25.0.6 with SMTP id 6csp309371lfa;
        Fri, 19 May 2017 07:06:25 -0700 (PDT)
X-Received: by 10.55.140.134 with SMTP id o128mr9602198qkd.21.1495202785679;
        Fri, 19 May 2017 07:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495202785; cv=none;
        d=google.com; s=arc-20160816;
        b=aYSC/U2jGtQD2RnfzHZ9xlczoWIoNGLAlqjA//WFp0LM/NVC0r3mLFz7cvIh2HWFBV
         AtKjyyoYWZN3bf3le2ATKtIZRz0bqOmg1fhf0Bv6Z5hr5UH7fLJCPa3W34AnKEMS5BzQ
         m6k6lohKqtbkf3GPLD6KehWZUx1SMIja2sxBvkMTN1XkY9Y0tDHT4xRD6rjnYlZcXmqp
         o0ORWXnd/waULpgRet0cc74JVP93WxXGgRyQZQ0HS5NkjEcuxxUi6elwSHlcqmYCej+S
         PpUiT+XjtSuttnpo1jHzpeW60rkdDWfH+JqKn1roLkRQ++aUDJeX+w00oA56+G7YljDT
         ly9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=hF0kY6UvI4c3eepgt8XVsPnLVow7HNEkXID20Q8XdMg=;
        b=HQ2gCJsbXJ3VwLyjUVFjlmXfT+UqHlRWCjCvUOqNjPF+STYWiXH0FmuKPybfmVtcxf
         krTgu2f0PUWHjlWH+Qtjca7j87voND2A4pe59hh9tG7w9yucm7qQag8cCm1hCw/zkGY7
         8B6b2FHYrh8A/M65jsdn0aXmmM6FLnSMxaoKdD1YpK3oSRLdO3YVO+rhhTYEU1Zvhz8Z
         r/f4c4O+PkhC2IC0zOA1ciNRysRC5q44HUU6mW9LiOj11EP82tbKFyph26VrQc9p4Kua
         l0Y/8aczq22iSyXTMLwF1bgsC9tuX+U/KnNIhZ7+gaItklu5VTn5sSd+AO5EWgdYZ6oJ
         YfYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 14si9091324qkr.151.2017.05.19.07.06.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 May 2017 07:06:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBiXx-0000lk-3r
	for alex.bennee@linaro.org; Fri, 19 May 2017 10:06:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhlcindy@gmail.com>) id 1dBakS-00037k-WF
	for qemu-arm@nongnu.org; Fri, 19 May 2017 01:46:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhlcindy@gmail.com>) id 1dBakS-00070A-7c
	for qemu-arm@nongnu.org; Fri, 19 May 2017 01:46:49 -0400
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:36809)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zhlcindy@gmail.com>)
	id 1dBakQ-0006zv-0w; Fri, 19 May 2017 01:46:46 -0400
Received: by mail-wm0-x22c.google.com with SMTP id 70so68768357wmq.1;
	Thu, 18 May 2017 22:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=hF0kY6UvI4c3eepgt8XVsPnLVow7HNEkXID20Q8XdMg=;
	b=IJRlUP64S4sbXxdUtzt4AfKZFfkeQXzf4TUiywD4XRSmXAXkYpMLSPtuomSD16teoh
	8uj6E2whKL3Z38/IgIeKZfEwPc/xMIAuzkKFjmN932ilZ9HtUH26Ou0ijwHDaqR64d05
	DhgW7DHS/5BFDex9VjdKOo/VSNzvGRAk1KY7upV3y9DJSlWLjlWqzUD7kXRDWq36Ra5q
	Iu+jHVQ/We6fxkiyi/CKkBzJ0ErCQzfjV/C0m6PFq+En9He78X01xOykAL1pZ6dRIHWp
	Flz6ETcKeLu4IQ7/Y+86N3lOM+LRg2B1Vrg/MwNdXjQ3CvilSrD/hj89zBX6Gpbsd0jV
	hC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=hF0kY6UvI4c3eepgt8XVsPnLVow7HNEkXID20Q8XdMg=;
	b=T2DkGpZ1+KpdqTwNhEmLMmg5ZMSQP9lBxJA7ocCGvVLJ+/zl7rUH2UpN+94re0isov
	ygqMrhafugcYBNLq2CQE/FyBfCkm8ww8lbeRMUZJOzfNYqroFcpEA53Ck10xqJlzWDig
	bjLpSws3rlRXPcke/OOJrhoFxWOCTdOhTgiaW9HR8KqkUh+H1HSuu8ITmtAqrj69rWjE
	0aionfpolTB06rP9sX+rAs99g7a5HgP9UpkSzY5u5hPCVVh/jUv9iEjmmJekmr/aTkHQ
	IWrVXuYCzJKlFwtm/jQaUj/HEIDRo7865hfIVruFCXHOTaIwNACDkamvLzU2qsXpk2aC
	LzEA==
X-Gm-Message-State: AODbwcBrDqHzwC/LgkbFZZBFeIKkp6dZ1jzitCxjvfrNMYiD88RZZpOJ
	gOWPVPa4Xs2DaUIOFDa/N6uB2rpmItHT
X-Received: by 10.80.178.228 with SMTP id p91mr5860637edd.131.1495172804430;
	Thu, 18 May 2017 22:46:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.13 with HTTP; Thu, 18 May 2017 22:46:44 -0700 (PDT)
From: Li Zhang <zhlcindy@gmail.com>
Date: Fri, 19 May 2017 13:46:44 +0800
Message-ID: <CAD8of+qgOQyU3QBk6YmPd4RnXQV0W-T4AE868q6y7TkCwu1K2A@mail.gmail.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Content-Type: multipart/alternative; boundary="f403045c7f4ee2d370054fda0b84"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22c
X-Mailman-Approved-At: Fri, 19 May 2017 10:06:14 -0400
Subject: [Qemu-arm] A problem of IRQchip in QEMU and KVM for ARM
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W03sM/5xHTMp

--f403045c7f4ee2d370054fda0b84
Content-Type: text/plain; charset="UTF-8"

Hi,

I am looking into QEMU code in ARM recently and trying to add add_hot_cpu
in QEMU for ARM,
but it doesn't work when enabling KVM. It reports error:

"kvm_init_vcpu failed: Device or resourc busy."

By debugging QEMU with gdb, it failed on ioctl. In kernel soruce code
arch/arm/kvm/arm.c,
vcpu is created by this following function, it will report -EBUSY if
irqchip_in_kernel.

struct kvm_vcpu *kvm_arch_vcpu_create(struct kvm *kvm, unsigned int id)
{
        int err;
        struct kvm_vcpu *vcpu;

        if (irqchip_in_kernel(kvm) && vgic_initialized(kvm)) {
                err = -EBUSY;
                goto out;
        }

  ....
}

I set virt machine with kernel_irqchip = off, it can execute cpu-add
interface correctly with qmp-shell
commands. But VMs still can't work well with kernel_irqchip=off when
executing "info cpus" in qemu monitor.

My question is that:
1) Can we change this error status in kvm_arch_vcpu_create?
2) Is it that irqchip_kernel=off  isn't supported with KVM enabled on ARM?

-- 

Best Regards
-Li

--f403045c7f4ee2d370054fda0b84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, <br><br>I am looking into QEMU code in ARM recent=
ly and trying to add add_hot_cpu in QEMU for ARM, <br>but it doesn&#39;t wo=
rk when enabling KVM. It reports error: <br><br>&quot;kvm_init_vcpu failed:=
 Device or resourc busy.&quot;<br><br></div><div>By debugging QEMU with gdb=
, it failed on ioctl. In kernel soruce code arch/arm/kvm/arm.c, <br></div><=
div>vcpu is created by this following function, it will report -EBUSY if ir=
qchip_in_kernel. <br><br>struct kvm_vcpu *kvm_arch_vcpu_create(struct kvm *=
kvm, unsigned int id)<br>{<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in=
t err;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct kvm_vcpu *vcpu;=
<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (irqchip_in_kernel(kv=
m) &amp;&amp; vgic_initialized(kvm)) {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D -EBUSY;<b=
r>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 goto out;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
}<br>=C2=A0<br></div><div>=C2=A0 ....<br>}<br><br></div><div>I set virt mac=
hine with kernel_irqchip =3D off, it can execute cpu-add interface correctl=
y with qmp-shell<br></div><div>commands. But VMs still can&#39;t work well =
with kernel_irqchip=3Doff when executing &quot;info cpus&quot; in qemu moni=
tor. <br><br></div><div>My question is that: <br></div><div>1) Can we chang=
e this error status in kvm_arch_vcpu_create?=C2=A0 <br></div><div>2) Is it =
that irqchip_kernel=3Doff=C2=A0 isn&#39;t supported with KVM enabled on ARM=
? <br></div><div><br>-- <br><div class=3D"gmail_signature"><div><br></div>B=
est Regards<div>-Li</div></div>
</div></div>

--f403045c7f4ee2d370054fda0b84--

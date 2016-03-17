Received: by 10.25.208.211 with SMTP id h202csp468658lfg;
        Thu, 17 Mar 2016 07:16:22 -0700 (PDT)
X-Received: by 10.55.31.82 with SMTP id f79mr14474734qkf.42.1458224182604;
        Thu, 17 Mar 2016 07:16:22 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t79si885149qkt.80.2016.03.17.07.16.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 07:16:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agYis-0003o0-0f
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 10:16:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1agYiP-0003QW-Kn
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 10:15:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1agYiL-00020D-Lh
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 10:15:53 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:37889)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1agYiL-000209-Ef; Thu, 17 Mar 2016 10:15:49 -0400
Received: by mail-wm0-x235.google.com with SMTP id l68so119240097wml.1;
	Thu, 17 Mar 2016 07:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jkkEFTGZRo/6QYqgRQ85yjVsxiDYAmiVfCEE+ru9H78=;
	b=Z+vs8J5lsrEQ1irOEhKtnV62ek8w8e1ccDomNM10yCjcAhn64Cq54qNpOxb5ofIt8l
	F2UP8HerqDriNRsGSACYC1+MOAfET1AiqXQgHuLRGDySw+ReDDuTItn/tPCzk2mIG6At
	dzS8lKDLJ12l5elrsA69a3QSSOOH3llibTDnrG3fmtHpbiF05H7mMiJ2k5EUtDNoSNzY
	96e3L/Hw7fwl5FgaiV6+E415voisT1RGCg4rEtsB5FbR4ivm8dL1L0xct1nUbdApry2O
	4n+ExtXFgmukGiRBQo4/ROGOgNaRMImQ2an0CgQLK76rA+QjjfSjl+aIkgkap8T0YaiD
	udBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jkkEFTGZRo/6QYqgRQ85yjVsxiDYAmiVfCEE+ru9H78=;
	b=GDn1Rv+sw3lAIQNS3MvJkvaqVSB6Xn4zsBSkpMxWvxeqMaP68HdynYPtyuxJUNuMhw
	hxZr46XZfePGTnoASfKDFkt+9Cs1QZPTJPh15cmQ3iBeJB7MP1e8+nisC/jamdSZFogl
	W2eGFrK3GdsiaKb83mOnPIY1c1zUY3Zp4kXuK6vBzWDcZc5LrUtjTXypq/y/RP5LXMpk
	UAtKpcvymTLzpDQLPQt5/r4/GcF4fSzpPOcyo/CiTGUY/Ju9XZSigMHH796LuL7IQoAT
	5tn58FOIqDY0uMGRBqHlmCQmUofq1egg6fmEf+7ZvZ7+8OrCLyTo+2hoDHeGqNeAdAur
	+JVg==
X-Gm-Message-State: AD7BkJIZXW58IjgtNQlDIOMH9hTWM/AF6ejyQburwkK6uoNsWedRXbDugAOC7vSkeW8sKA==
X-Received: by 10.28.215.79 with SMTP id o76mr37193416wmg.95.1458224148690;
	Thu, 17 Mar 2016 07:15:48 -0700 (PDT)
Received: from localhost (host109-156-68-66.range109-156.btcentralplus.com.
	[109.156.68.66])
	by smtp.gmail.com with ESMTPSA id gt7sm7901086wjc.1.2016.03.17.07.15.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 07:15:47 -0700 (PDT)
Date: Thu, 17 Mar 2016 14:15:46 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Sanchez, Juan Carlos (GE Aviation)" <juan.carlos.sanchez@ge.com>
Message-ID: <20160317141546.GK14062@stefanha-x1.localdomain>
References: <709659D8C88A4047B113A8F68771E8EA46B91006@ALPMBAPA12.e2k.ad.ge.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MHXEHrrXKLGx71o"
Content-Disposition: inline
In-Reply-To: <709659D8C88A4047B113A8F68771E8EA46B91006@ALPMBAPA12.e2k.ad.ge.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] Hi good afternoon, some small support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HJijIN+aoeWy


--3MHXEHrrXKLGx71o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2016 at 08:52:37PM +0000, Sanchez, Juan Carlos (GE Aviation=
) wrote:
>  	I am trying to execute an image created by ARM in QEMU using windows OS=
, could you give me guide to example the command line?=20
>=20
> The command line in Unix work well, but I don't understood all the option=
s. This the reason that I looking for some help
>=20
> /home/nhcu02t/yocto_i686/prebuild/sysroots/i686-pokysdk-linux/usr/bin/qem=
u-system-arm -kernel zImage-qemuarm.bin -net nic,model=3Dvirtio -net tap,vl=
an=3D0,ifname=3Dtap0,script=3Dno,downscript=3Dno -M versatilepb -drive file=
=3D/home/nhcu02t/yocto_org_built/images/qemuarm/core-image-minimal-qemuarm.=
ext4,if=3Dvirtio,format=3Draw -no-reboot -show-cursor -usb -usbdevice wacom=
-tablet -no-reboot -m 128 -serial mon:vc -serial null --append "root=3D/dev=
/vda rw console=3DttyAMA0,115200 console=3Dtty ip=3D192.168.7.2::192.168.7.=
1:255.255.255.0 mem=3D128M highres=3Doff rootfstype=3Dext4 "
>=20
>=20
> I accept any help that you provide me.

Did you look at the documentation?

This should help you understand most of the options:
http://qemu.weilnetz.de/qemu-doc.html

If you have specific questions, feel free to ask.

Stefan

--3MHXEHrrXKLGx71o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJW6rwSAAoJEJykq7OBq3PIVEsIAKXxaTuOopQAb4LFSlqYNc9T
sJPTjU+9Q975o5kRK7+GpvuvmQB0qjAhZA54ZGiFDYl4P+wqUFaaEY1KLPAWXrup
A6iX5I8h9OS4bJYY0qHV46REuBGVAncZv/YAQ0284PZddzD6Vb5R5I8JyJYw+mET
Sk88onYiHgnw/dMpEICDgBsPbnS/fdosKEgJQXQtFuxOU+S28HFpqv2rrIHWdOjV
VisHwnqRcxCRQCkkuYa8eBDyYAv845vpp/o2a+A09iKoxWfKwG5diZGTO0lg3hgs
sZSOraZC+ZLLUGIGlXTuTimWpgIpzsGMhJHq6DFEmwhnkF4f9Rzz5uVI9W4U6Y8=
=jEul
-----END PGP SIGNATURE-----

--3MHXEHrrXKLGx71o--

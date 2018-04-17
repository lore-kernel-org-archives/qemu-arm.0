Received: by 10.28.4.212 with SMTP id 203csp4295254wme;
        Tue, 17 Apr 2018 14:34:36 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49ygEuMi33+EcbtWwqzX9ytKRWsd6cVnI7V++wcQlzJ3qsLCv4IltS2eF6Vv+gCzBEMoPRf
X-Received: by 2002:a25:b58a:: with SMTP id q10-v6mr2787521ybj.62.1524000875894;
        Tue, 17 Apr 2018 14:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524000875; cv=none;
        d=google.com; s=arc-20160816;
        b=q2wfWIltcRUGmF3b5yTjY6miZr1gogzpHO6/4bSrtvebB/Liy8YY42hV6z57m9L2XT
         w7mfqXlefF+gCPmhTPXQ0AEtdnH6RzLdk41+kJTe1HApWt+zN/LOD7ofvm29KiBmUlFA
         WPwxoJiTtZEnsZ5Jthexd3FOdAPyuSzsvKv+YRU2NiOguWpJtPcNypQN/vgyNIAAwLKf
         +xL/PGguClDCR+LqzsjTWJih1i0AbGKcWWOK5mxWowFTC3r4Ny5yVe9hDYogoNyegkVB
         i0v2VpRBkt2F47qD0mmCpVwVsAIhOrL6CGIL5LTfTH2GdIHjqq/GnVNGB+Ibr+iFu28n
         OATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=wgSCCdXHJn46bNJNeP0G/CNBG38WxjsYiRq6mRz5whI=;
        b=DaPpQSp1eSvuv/0nauMdCq9A9yR/5g7eM+3c4H7Bl09LKrW87ALFXxc7h3yWKx9aFc
         pP6c5tNKYHU0HTEgfN7Vti0y1byyYUVx7z18nNeHRrrHGG++QF+yQLUXL/pskyW3fK6N
         //Brvch1TqTrMEQbiHa8WAfY5u7DbZJupXjWykaift5df8fBfScVdUewLgR+FtYVviBv
         /etOOiBpfWdWGTQUpoESZkGgBsazjkcn8sRzhHS7muQLrHpUnRa75FbpAnZomw0TQvk0
         UR3awMXrU8X7Ihvpn49NxpXl9CF6F5ZFmVYJ0j4h4yuoVLkhUouLdsgEN5WP+hcKq4Rf
         s5cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a/iKrX2n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r11si4973214qkk.245.2018.04.17.14.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 14:34:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a/iKrX2n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8YFH-0002jV-Ci
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 17:34:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hwertz10@gmail.com>) id 1f8YDM-0001Tx-Df
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 17:32:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hwertz10@gmail.com>) id 1f8YDF-0005UF-3B
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 17:32:36 -0400
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:34759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hwertz10@gmail.com>)
	id 1f8YDE-0005N7-M7; Tue, 17 Apr 2018 17:32:28 -0400
Received: by mail-wr0-x22a.google.com with SMTP id d19so39364014wre.1;
	Tue, 17 Apr 2018 14:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=wgSCCdXHJn46bNJNeP0G/CNBG38WxjsYiRq6mRz5whI=;
	b=a/iKrX2nCfJkne/xEB4T2VR1eN82xqfc52uBS/WsTka0DFvLJiESPQiRe4/7tzKvTW
	Mp2JPxWTM/5k2bBlPrLqrNhaPAOqwk/195DS38lJtdezc+EIaHqWMTEv7n1yyVI4NnUC
	0atOQvGrgExGtNtaROEgBcVvxp7zmKEL90dHbc5B9iuIaAFjlFHpycSk5DaUPOohkiBH
	3Y9UMwmqLkfPs5Ww+lhzRq7KztGZiMpn6bkJ7QS2powE7OFO3xw/4jw2K07+AWQpkdUs
	oBr7ufEm92E8TSK0Ctu3J2FerbAEI9Kk51ewhV2UHds5FFzsg66pFAyoiSMaCvnUseHM
	FYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=wgSCCdXHJn46bNJNeP0G/CNBG38WxjsYiRq6mRz5whI=;
	b=Yh8zf34y0tNvf8dZNWsLWloL5TqKZPydwUYs5p8k6aNk1tHK2trCg5gb6oW55zBbHg
	2OW7cNcpeMOxxP29ONWSFn13lVrANWCtD8ua6jzGN3/b55FxbfkRb/O8gE0wiPZYCeBH
	wnmSD5YEd5mp/GX6nYmqPBlPrllitR/5KLWxp345sqYX7iKTDexEce0Zvq2ays4Jzz9+
	KYrcF/C0wUw1u54tocXEIb6li84pEZ6yECCoy4jF659cMihP0vNzNY81eE+u4uXioy4B
	U7mqZZyRjh9Po2xOu095N83WA9uQVjun9ci6GXgJ29QLOaqqySD3pkzBsKHnrW0PrkkG
	BUeQ==
X-Gm-Message-State: ALQs6tAsCLnEFQ+lSyMNRs53wzXAlm6bvBWbS5GAgpxYGl0nlNF31jmU
	/udC/XFckP+sXJJr4hkO8R9/VRrrs0WV5VcAGKtZBmHaP8I=
X-Received: by 10.223.178.87 with SMTP id y23mr2736935wra.95.1524000747308;
	Tue, 17 Apr 2018 14:32:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.129.104 with HTTP; Tue, 17 Apr 2018 14:32:26 -0700 (PDT)
From: Henry Wertz <hwertz10@gmail.com>
Date: Tue, 17 Apr 2018 16:32:26 -0500
Message-ID: <CAOuPqTFJABMcDHmQcNoNZioBBJ8RcreeevsRfh5b46ZgKZLetw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/mixed; boundary="f403045f1a0a2e9baf056a1213be"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
Subject: [Qemu-arm] ARM memory barrier patch
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
X-TUID: fX1IUMn5CJTM

--f403045f1a0a2e9baf056a1213be
Content-Type: multipart/alternative; boundary="f403045f1a0a2e9bac056a1213bc"

--f403045f1a0a2e9bac056a1213bc
Content-Type: text/plain; charset="UTF-8"

Please find submitted a patch for ARM memory barriers.  This patch is
against qemu-2.12-rc2 but I do believe it should apply for anything from
2.11.x to current. (the code being patched was added in for 2.11 series.)


I found with qemu 2.11.x or newer that I would get an illegal instruction
error running some Intel binaries on my ARM chromebook.  On investigation,
I found it was quitting on memory barriers.
qemu instruction:
mb $0x31
was translating as:
0x604050cc:  5bf07ff5  blpl     #0x600250a8

After patch it gives:
0x604050cc:  f57ff05b  dmb      ish

In short, I found INSN_DMB_ISH (memory barrier for ARMv7) appeared to be
correct based on online docs, but due to some endian-related shenanigans it
had to be byte-swapped to suit qemu; it appears INSN_DMB_MCR (memory
barrier for ARMv6) also should be byte swapped  (and this patch does so).
I have not checked for correctness of aarch64's barrier instruction.

Signed-off-by: Henry Wertz <hwertz10@gmail.com>

--f403045f1a0a2e9bac056a1213bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span class=3D"gmail-im">Please find submitted a patc=
h for ARM memory barriers.=C2=A0 This patch is<br>
against qemu-2.12-rc2 but I do believe it should apply for anything from<br=
>
2.11.x to current. (the code being patched was added in for 2.11 series.)<b=
r><br></span><br><span class=3D"gmail-im">I found with qemu 2.11.x or newer=
 that I would get an illegal instruction<br>
error running some Intel binaries on my ARM chromebook.=C2=A0 On investigat=
ion,<br>
I found it was quitting on memory barriers.<br>
qemu instruction:<br>
mb $0x31<br>
was translating as:<br>
0x604050cc:=C2=A0 5bf07ff5=C2=A0 blpl=C2=A0 =C2=A0 =C2=A0#0x600250a8<br><br=
>
After patch it gives:<br>
0x604050cc:=C2=A0 f57ff05b=C2=A0 dmb=C2=A0 =C2=A0 =C2=A0 ish<br><br>
In short, I found INSN_DMB_ISH (memory barrier for ARMv7) appeared to be co=
rrect based on online docs, but due to some endian-related shenanigans it h=
ad to be byte-swapped to suit qemu; it appears INSN_DMB_MCR (memory barrier=
 for ARMv6) also should be byte swapped=C2=A0 (and this patch does so).<br>
I have not checked for correctness of aarch64&#39;s barrier instruction.<br=
><br></span></div><span class=3D"gmail-im">Signed-off-by: Henry Wertz &lt;<=
a href=3D"mailto:hwertz10@gmail.com">hwertz10@gmail.com</a>&gt;<br><br>
</span></div>

--f403045f1a0a2e9bac056a1213bc--
--f403045f1a0a2e9baf056a1213be
Content-Type: text/x-patch; charset="US-ASCII"; name="arm-mb.patch"
Content-Disposition: attachment; filename="arm-mb.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jg46ow5z0

KioqIHRjZy9hcm0vdGNnLXRhcmdldC5pbmMuYy5vcmlnCTIwMTgtMDQtMDQgMTU6Mjg6NTAuMDAw
MDAwMDAwIC0wNTAwCi0tLSB0Y2cvYXJtL3RjZy10YXJnZXQuaW5jLmMJMjAxOC0wNC0xNiAxMjo1
NTowNC45MTc1MTg4OTggLTA1MDAKKioqKioqKioqKioqKioqCioqKiAxNTgsMTY3ICoqKioKICAg
ICAgSU5TTl9MRFJEX1JFRyAgPSAweDAwMDAwMGQwLAogICAgICBJTlNOX1NUUkRfSU1NICA9IDB4
MDA0MDAwZjAsCiAgICAgIElOU05fU1RSRF9SRUcgID0gMHgwMDAwMDBmMCwKICAKISAgICAgSU5T
Tl9ETUJfSVNIICAgPSAweDViZjA3ZmY1LAohICAgICBJTlNOX0RNQl9NQ1IgICA9IDB4YmEwZjA3
ZWUsCiAgCiAgICAgIC8qIEFyY2hpdGVjdGVkIG5vcCBpbnRyb2R1Y2VkIGluIHY2ay4gICovCiAg
ICAgIC8qID8/PyBUaGlzIGlzIGFuIE1TUiAoaW1tKSAwLDAsMCBpbnNuLiAgQW55b25lIGtub3cg
aWYgdGhpcwogICAgICAgICBhbHNvIEp1c3QgU28gSGFwcGVuZWQgdG8gZG8gbm90aGluZyBvbiBw
cmUtdjZrIHNvIHRoYXQgd2UKLS0tIDE1OCwxNjcgLS0tLQogICAgICBJTlNOX0xEUkRfUkVHICA9
IDB4MDAwMDAwZDAsCiAgICAgIElOU05fU1RSRF9JTU0gID0gMHgwMDQwMDBmMCwKICAgICAgSU5T
Tl9TVFJEX1JFRyAgPSAweDAwMDAwMGYwLAogIAohICAgICBJTlNOX0RNQl9JU0ggICA9IDB4ZjU3
ZmYwNWIsCiEgICAgIElOU05fRE1CX01DUiAgID0gMHhlZTA3MGZiYSwKICAKICAgICAgLyogQXJj
aGl0ZWN0ZWQgbm9wIGludHJvZHVjZWQgaW4gdjZrLiAgKi8KICAgICAgLyogPz8/IFRoaXMgaXMg
YW4gTVNSIChpbW0pIDAsMCwwIGluc24uICBBbnlvbmUga25vdyBpZiB0aGlzCiAgICAgICAgIGFs
c28gSnVzdCBTbyBIYXBwZW5lZCB0byBkbyBub3RoaW5nIG9uIHByZS12Nmsgc28gdGhhdCB3ZQo=
--f403045f1a0a2e9baf056a1213be--

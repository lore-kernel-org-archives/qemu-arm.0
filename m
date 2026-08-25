Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB75C61DB6
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 08:00:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wym5J-0005fC-8L; Tue, 25 Aug 2026 04:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wym5H-0005f3-Mi
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 04:00:39 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wym5E-0004tV-T0
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 04:00:39 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-38d489b6b71so5335111a91.0
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 01:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787644835; x=1788249635; darn=nongnu.org;
 h=references:to:cc:in-reply-to:date:subject:mime-version:content-type
 :message-id:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=euFmNfAinSIbXgk5B0RB8xWWect/SKNPPu9ORlgFI+M=;
 b=Z8NPKG+aETM+06fJlhRF5QaemO6lB39Bn2u1WfsbXda0vOr0v0qV1fKrf0Ki93GCMP
 eZvP2A5speEMZV03rZCiy9eyCsOFiMeOhqVJipVngnQoWiDZILrfVVsSIPWcGcG58hDJ
 G6A5TDDNKQWgq8L5yn2R+nghgtYwclWsooPZLIKNFfS+Kurk1rzR+yHuGd+jw0nd7fcQ
 s+OOC1iaEnBFjxr25aoDXiD5kcTC6dz+tcG1YKd1DypsBOIc6RBASEp3zffydZlIcP06
 sE5iTh7C1zRH2Stkfq5BKYDhiqie6NRs4yp9JM66qyjAh7bL/IKSs+/s3Q5i7cZrtrSR
 6n6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787644835; x=1788249635;
 h=references:to:cc:in-reply-to:date:subject:mime-version:content-type
 :message-id:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=euFmNfAinSIbXgk5B0RB8xWWect/SKNPPu9ORlgFI+M=;
 b=XCi9gXLhkyUSISyTGxsWSdWMzOEqpyFC4bSygIR9paAeODIvqfD/nvoE1A+rJqBX9f
 orqPUWb7kUU4jCcLSa8fxsLcwLAsvN2Vg1eBBLb4UUb0SQpE9HBtEhab8DDxolTvzXqr
 lXrRWIzbt9uD5IpawzYsqlISJg/izOuxf+v/RDMttnrC/3IIT9VMD2JFDq6QOGtdWGjz
 2xjC6w5hJL4e6aBKYG6/Dli1XOShC+bli8gbxYsNgy5/GkgYZ8u7OA7WWAZo29nS4Gj4
 VN/2Qkjshenz6gEauVliCqiAWC14GIQwQWpasZmpFdFCLXoLtqytHbyfW8GUndv3pdiJ
 UMzQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoWWzurdZZucHG9tSS1WWcs/U3HWTmovey7nyEAdRVSO2l9yLv4XzHztnz2Bhos3uVuZ8pjmye7oQ==@nongnu.org
X-Gm-Message-State: AFuF++nCzGgQfkpsyfGvfO/jof9rkNtSLUWbMwXmvAYN7gvxU+2u/tjH
 jwsZjcHoMvaoUSflPkI8MfXjE091N28lO5BlU07XKJe3aVKRGP6ciu6T
X-Gm-Gg: AR+sD12WpXhH4GIVDmQdW+L2xC4akj9E3dbAJ2uzyCVaaQpoK6GnH9uNUgZmFiuRmLj
 yk+YP70uVMEBu79vnbE/+h/QkebAvBzxeotjr1V2m75ZOdcg2U/NJ/nT7COKdUgpGstFas2JVnN
 bQcWiyVb4b5OGFuRM0/nziBkfmKdtS2cxg2+nNkyt2v1O0W0t+rehBVIS+jfnhnRCsT/E8CNjqI
 mnf95K//IQ3yM2DbQv3nCSklC+0T6Yr5oT7blA5j39H7ptAyGXEz+SFAH7kVQksx8BKCDCMuHpb
 mgTYDxx9QUSSMrCtz9jo162+ACqVRnNvQPaBOIwRiRi7qxU95Ur/EEzmC4Hbh0xaPS105fg7wCu
 e1mtivZry+LaiFa48Ax68BuN1XA9myUq3qT6Zl4Eb9m9i7gak3xeKDEZs7YbRW55rKFRWs1tR1q
 A5SGdxizc6a11n+8kqKIvZQXJT5KDwcHFM5Rv4P//azcXP+fHdPAa7kAxyEoGhQGYa6/yc
X-Received: by 2002:a17:90a:ec8e:b0:38e:c7b0:84ad with SMTP id
 98e67ed59e1d1-395c2f2a10bmr59474917a91.0.1787644834970; 
 Tue, 25 Aug 2026 01:00:34 -0700 (PDT)
Received: from smtpclient.apple ([117.55.237.216])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39645b4d52asm2954576a91.8.2026.08.25.01.00.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Aug 2026 01:00:34 -0700 (PDT)
From: Jack Wang <163wangjack@gmail.com>
Message-Id: <5783F0B2-CF7F-450D-82DA-93A6BB0CFA38@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_89A7ACB3-A0DD-4BA4-9A66-588A552C91FB"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v3 0/5] Add Axiado SoC AX3005 and EVB
Date: Tue, 25 Aug 2026 16:00:17 +0800
In-Reply-To: <9eb76bbd-be48-4095-85ab-7097a7a94a09@axiado.com>
Cc: qemu-devel@nongnu.org,
 peter.maydell@linaro.org,
 qemu-arm@nongnu.org
To: kchiu@axiado.com
References: <9eb76bbd-be48-4095-85ab-7097a7a94a09@axiado.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=163wangjack@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org


--Apple-Mail=_89A7ACB3-A0DD-4BA4-9A66-588A552C91FB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Understand.
I still need some basic info for confirmation.What the is mmio window =
size for each uart? Is it designed to be overlapped.Do all UART =
instances use the same register layout and window size?

Thanks=20
JW..
> On Tue, 25 Aug 2026 14:07:07 +0800, Kuan-Jui Chiu <kchiu@axiado.com> =
wrote:
> Hi Jack
>=20
> Sorry that I can't provide the datasheet due to the company policy
>=20
> I can only share about the SoC specification in cover letter and use =
the=20
> existing QEMU models like Axiado SDHCI and Cadence GPIO
>=20
>=20
> I never enabled QMP before but you are right on this missing class=20
> problem. I am studying for how to use QMP right now.
>=20
>=20
> B.R.
>=20
> Howard
>=20
> Jack Wang =E6=96=BC 2026/8/25 =E4=B8=8B=E5=8D=88 01:52 =E5=AF=AB=E9=81=93=
:
>=20
>=20

>> On Tue, 25 Aug 2026 13:52:51 +0800, Jack Wang <163wangjack@gmail.com =
<mailto:163wangjack@gmail.com>> wrote:
>> Hi Kuan-Jui,
>>=20
>> Cheers for the v3, that was a really quick update!
>>=20
>> The basic tests passed on my local machine, and I will look through =
each patch carefully next. I'm not sure if I'm qualified enough to give =
Reviewed-by or Tested-by tags yet. Anyway, if anything I do during the =
review is inappropriate, please just let me know.
>>=20
>> I checked the https://axiado.com/products/ link you mentioned, but =
didn't find the critical info I needed. I googled for the AX3005 =
datasheet but not much useful infomation. AI tell me it's not =
public.emmm.. If you could offer me some key hardware information for =
the QEMU modeling, that would be much better.
>>=20
>> Also, since you asked for my commands before, if I find any problems, =
I will attach the exact commands I used in the email to help identify =
the bug. I am testing on my Mac now, so please contact me if you have =
any trouble reproducing the issues.
>>=20
>> Best regards, : )
>>=20
>> JW..

--Apple-Mail=_89A7ACB3-A0DD-4BA4-9A66-588A552C91FB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta charset=3D"UTF-8"><meta http-equiv=3D"content-type" =
content=3D"text/html; charset=3Dutf-8"></head><body =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;"><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; display: inline =
!important; float: none;">Understand.</span><br style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; display: inline !important; float: none;">I still =
need some basic info for confirmation.What the is mmio window size for =
each uart? Is it designed to be overlapped.Do all UART instances use the =
same register layout and window size?</span><br style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration-line: none; text-decoration-thickness: auto; =
text-decoration-style: solid;"><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; display: inline =
!important; float: none;">Thanks<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration-line: none; text-decoration-thickness: auto; =
text-decoration-style: solid;"><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; display: inline =
!important; float: none;">JW..</span><br style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: =
solid;"><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: =
none; text-decoration-thickness: auto; text-decoration-style: solid;">On =
Tue, 25 Aug 2026 14:07:07 +0800, Kuan-Jui Chiu &lt;kchiu@axiado.com&gt; =
wrote:<br>Hi Jack<br><br>Sorry that I can't provide the datasheet due to =
the company policy<br><br>I can only share about the SoC specification =
in cover letter and use the<span =
class=3D"Apple-converted-space">&nbsp;</span><br>existing QEMU models =
like Axiado SDHCI and Cadence GPIO<br><br><br>I never enabled QMP before =
but you are right on this missing class<span =
class=3D"Apple-converted-space">&nbsp;</span><br>problem. I am studying =
for how to use QMP right now.<br><br><br>B.R.<br><br>Howard<br><br>Jack =
Wang =E6=96=BC 2026/8/25 =E4=B8=8B=E5=8D=88 01:52 =
=E5=AF=AB=E9=81=93:<br><br><br></blockquote><br style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: =
solid;"><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: =
none; text-decoration-thickness: auto; text-decoration-style: =
solid;"><blockquote type=3D"cite">On Tue, 25 Aug 2026 13:52:51 +0800, =
Jack Wang &lt;<a =
href=3D"mailto:163wangjack@gmail.com">163wangjack@gmail.com</a>&gt; =
wrote:<br>Hi Kuan-Jui,<br><br>Cheers for the v3, that was a really quick =
update!<br><br>The basic tests passed on my local machine, and I will =
look through each patch carefully next. I'm not sure if I'm qualified =
enough to give Reviewed-by or Tested-by tags yet. Anyway, if anything I =
do during the review is inappropriate, please just let me know.<br><br>I =
checked the<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://axiado.com/products/">https://axiado.com/products/</a><spa=
n class=3D"Apple-converted-space">&nbsp;</span>link you mentioned, but =
didn't find the critical info I needed. I googled for the AX3005 =
datasheet but not much useful infomation. AI tell me it's not =
public.emmm.. If you could offer me some key hardware information for =
the QEMU modeling, that would be much better.<br><br>Also, since you =
asked for my commands before, if I find any problems, I will attach the =
exact commands I used in the email to help identify the bug. I am =
testing on my Mac now, so please contact me if you have any trouble =
reproducing the issues.<br><br>Best regards, : =
)<br><br>JW..</blockquote></blockquote></body></html>=

--Apple-Mail=_89A7ACB3-A0DD-4BA4-9A66-588A552C91FB--


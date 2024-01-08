Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2268241ejo;
        Mon, 8 Jan 2024 05:08:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQ7t2RK/UCTMV301HlT1dc5xIK3BWJV/mi2aeTtFp0lWUVM0ZvviAEMj/zCtZ1mzqgNq4m
X-Received: by 2002:a05:620a:6892:b0:781:5234:56ed with SMTP id rv18-20020a05620a689200b00781523456edmr3575428qkn.92.1704719321352;
        Mon, 08 Jan 2024 05:08:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704719321; cv=none;
        d=google.com; s=arc-20160816;
        b=0twCSxLPgs4sfywHtwSM9A5TRelPKs3fL8c4jc85uEWX4LkODzuE0C+bJJIfvWsmTU
         fqc8n7DudklU4yFkmu519mFoHZQPcpgSzJggiFlTC26L0DigBb+bQ2eHzCiFbF6NLqVc
         qO1O4ZCj9vI/iETYRnOEtttHUzm+oYG+h5VjcEdWdFrh9mKFiwoM+aOqLDIRo7OL8RyK
         HhGwO8mIE/12nqxq6YOkcapBQU3RfYnL2eg1h+oK1xhPV+Y8pWwQQJXE25yocIu3ToD7
         4TW7U8nNCniUJpBg39QXtJBt+mMgWkEn71zzFu16PJ37tqLLikdd6oWFK/5xfaE2sRKC
         QkzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=qRGkre4BD6hOHc5l0m0uf0cMrl5kOZ9XmzivJhgY/R0=;
        fh=cKhYZuA4dziQ7Wqnsq6LgUAvSsSS1lnAmKK9i7nSK/g=;
        b=KoA4w9DvcdpZHrzHBSVqqvyh3GeGfk87haSreFOxpfx2fO3VttJroxZbvd/VFJ1JpA
         GTx0Lr+dhcnjM3q9crgYDyNFHyYetU/R2s9O/6dQGBljFxoTo/63ekCjiJQH/eOOpuqo
         QsxqvAHa4k3iQqFHrGf0F7dfeV+ghIYSlc8LnKhKNB76z+RT4kPEWEVRZMisNYPP3D/H
         m7VtfVNfTVXNAJQf0i/kUeTlPT3bm96VCzIysp/JA9PwXnLKJOffYegFG1L1+F/MsQKn
         xAtqDqEQ81IjZNuajBLyUlNlIHFCHD3b/bx8DuCNk2/HVbPMr3VELvmiZtiiRk1g6WXy
         UlWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=NSl5oYXx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12-20020a05620a440c00b00781cbe35244si7983190qkp.679.2024.01.08.05.08.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 05:08:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=NSl5oYXx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMpMB-0003Dn-QS; Mon, 08 Jan 2024 08:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1rMpM9-0003Cw-8X; Mon, 08 Jan 2024 08:07:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1rMpM6-0004q3-4d; Mon, 08 Jan 2024 08:07:52 -0500
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 408D2EA0020592; Mon, 8 Jan 2024 13:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=qRGkre4BD6hOHc5l0m0uf0cMrl5kOZ9XmzivJhgY/R0=;
 b=NSl5oYXx12nrV3salCl7QgvLtaZaCyZ3hjsbPz4Wkn9DRZKQcHvMhAUQ/1AX2+6JjZB4
 oOIRH1v4UvZwFKAgIzeb0+RPUN+7PSf5zvBgF+hlVA3RY1U62s+jjuMi2+cEqP+LYUDK
 TncOicTUOdaXKRHqgZMu5PBBcUkWML4YK59VuF7+bL0XUti98ASmNWvsuVOsmt1eZTDx
 4IiQwahLEWHvb6ftcKaeLCzcugR8m3BbCz/pIv5JN4tV+r4QoVe2qw3saIrRrzgTBnNu
 qKm8XNixGYoy56mnnujQ6+q1g0xwdGUfJkeyXkFTdPFrPiXBV66CfcAoAPRhUqayx8tp jw== 
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vghk385br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jan 2024 13:07:45 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 408Adjsq000893; Mon, 8 Jan 2024 13:07:43 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vfkdjynse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jan 2024 13:07:43 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 408D7gg244171952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jan 2024 13:07:42 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 048782004B;
 Mon,  8 Jan 2024 13:07:42 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5DBD20043;
 Mon,  8 Jan 2024 13:07:41 +0000 (GMT)
Received: from [9.155.200.166] (unknown [9.155.200.166])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jan 2024 13:07:41 +0000 (GMT)
Message-ID: <99bf8c28ebd44be8dc59a911985e571afc15b8b1.camel@linux.ibm.com>
Subject: Re: [PATCH] tests/tcg: Don't #include <inttypes.h> in
 aarch64/system/vtimer.c
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Peter
 Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Mon, 08 Jan 2024 14:07:41 +0100
In-Reply-To: <1c18863a-ecf9-4522-af75-793cd358c745@linaro.org>
References: <20240108125030.58569-1-iii@linux.ibm.com>
 <1c18863a-ecf9-4522-af75-793cd358c745@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sTyhFZiEd253q3Z29v0IB7-iJyzTyJZG
X-Proofpoint-ORIG-GUID: sTyhFZiEd253q3Z29v0IB7-iJyzTyJZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-08_04,2024-01-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 suspectscore=0 mlxlogscore=528 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401080112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: +FbgJBFAwvK/

On Mon, 2024-01-08 at 13:56 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Ilya,
>=20
> On 8/1/24 13:50, Ilya Leoshkevich wrote:
> > make check-tcg fails on Fedora with:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 vtimer.c:9:10: fatal error: inttypes.h: No suc=
h file or
> > directory
> >=20
> > Fedora has a minimal aarch64 cross-compiler, which satisfies the
> > configure checks, so it's chosen instead of the dockerized one.
> > There is no cross-version of inttypes.h, however.
>=20
> Presumably this isn't specific to aarch64 target, so what about
> the other uses, shouldn't we clean all similar uses at once?
>=20
> $ git grep inttypes.h tests/tcg | wc -l
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 26

As far as I can see, these 26 occurrences are for user tests.

These work fine; I assume this is because the user cross-compiler is
chosen using a stricter configure check:

    write_c_skeleton
    case $1 in
      *-softmmu)
        if do_compiler "$target_cc" $target_cflags -o $TMPO -c $TMPC &&
          do_compiler "$target_cc" $target_cflags -r -nostdlib -o
"${TMPDIR1}/${TMPB}2.o" "$TMPO" -lgcc; then
          got_cross_cc=3Dyes
          break
        fi
        ;;
      *)
        if do_compiler "$target_cc" $target_cflags -o $TMPE $TMPC -
static ; then
          build_static=3Dy
          got_cross_cc=3Dyes
          break
        fi
        if do_compiler "$target_cc" $target_cflags -o $TMPE $TMPC ;
then
          build_static=3D
          got_cross_cc=3Dyes
          break
        fi
        ;;
    esac

[...]

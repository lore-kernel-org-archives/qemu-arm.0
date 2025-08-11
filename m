Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966F8CA0EC4
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 19:39:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulYLD-0007KB-HN; Mon, 11 Aug 2025 15:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ulYKz-0007Ih-3N
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 15:37:41 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ulYKr-0003yU-7g
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 15:37:40 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BIwXtd008762
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 19:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MyOgHjBYYMKt9HMvenjZWbkT
 C9+ScgzNIWdSuMydwfY=; b=Rgf213w76ynB3um7vMlJnfcfej/d9xJY3K+JuMzP
 TCN1GI/GAuwSbtPX7dfAJ/DjLCOI9EbrnDcuNJZ6yW7Zm4WX9iQPA3XHWQDFPe1w
 zb7f5o62lLe4czdxAe2bYcNxY3P70pHq48G2PSG7+goOtsWmlixNUi4YcW5l+uLx
 acj/xlp568N7VYfJ6RdwrFYfT0Q7pzZG7rg1jVVRIl2QozrEWjNzcV1uh7ohdOS1
 2QuEzFgzp1BkGEfXgFEEvKUWLE254/zA5C2QXzB6ed27vyktUQ8/qi+xh0EID+W7
 nRq0C5si6Fq0odWKZUFsOTHdSAsitrLOe1sbPEqtSYSgdA==
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjhewd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 19:37:29 +0000 (GMT)
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-e90697d44e4so1975038276.2
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 12:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754941049; x=1755545849;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MyOgHjBYYMKt9HMvenjZWbkTC9+ScgzNIWdSuMydwfY=;
 b=cfqFnHPV+QgBRi5+u74Tj9/bZTNJ0oefGzB0/xZg9+QC8+IDtH2Zd/GwrwZAR7G4wV
 My0AoWGdJQgf/U8U5v2ua7iZEjHvPH6Bv/0vnWgtK3x02MRvgwdkXNgcc+gDs8NeqLJ/
 0PnIp+xR13A7ayE8kIXbptex/k1mOzjMKbsj+Ot3PC8k82KXkJyrYb9tpCmywir6kX1a
 g2YMr9jL71laHhUu203z3vJblAY1jjs8ijFsdp3qPV5sauNvuer92yPrqazav+AeyuFl
 6fhFPhvEq71ISYm6MOxNtlE5/dAEAngvykRhEZ/cbuwZQpQURzScOI4fKr2YKrdlhTfS
 t9xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKNKM3yL6jgaif5U92wzmVOH23PmU2aq1NGmhj+V28WdNDX5cF1vnU9TWN62jRAfD0CZvAAxbHTw==@nongnu.org
X-Gm-Message-State: AOJu0YyemjtGAVVM16KXnzAi5ylcCxsm8lIuM32u+vN9+ROONAaN8qlZ
 earkrBbCC03oitCE5WzcPnlQUARxh/xGJPlZHfa8E1pYNgrjs31lLaNcWc5Dpr08gzkiLbEJcnk
 Snz+2OPT02v+rekJ+Y3Ety8/vmd19sHfYTYkT82SkrbrzLklUewWXUINiICFnEHB/Encw7hIOgI
 vUXN/R5+hBRcVljuA6rkh9fH+ySbgCxA==
X-Gm-Gg: ASbGncsKZN0seu4yN8i+VFR2E6GGDCIhtauNaTGq159eUZU12uvBE4PzX0t1+GqisGg
 t+yZMwu+h77b1hPIEJpYAel3gYGDxiGo6ky5tSlAykObnfyIMxayRCvJxhoy65wdn9KJ+5m5eI7
 w9tICqhjN0BPbwRjCnP37wYJI=
X-Received: by 2002:a05:6902:e04:b0:e90:69a1:1799 with SMTP id
 3f1490d57ef6-e917a263991mr1340437276.32.1754941049225; 
 Mon, 11 Aug 2025 12:37:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTNToA+ZCADla3FaB1yevm9lcgeRsr5CFijkpJHKu1ww3BP+GfaGbWTUgD3TEnPQh7G3OiQd5UP5/osfVLwIA=
X-Received: by 2002:a05:6902:e04:b0:e90:69a1:1799 with SMTP id
 3f1490d57ef6-e917a263991mr1340118276.32.1754941044044; Mon, 11 Aug 2025
 12:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250722201404.2368507-1-vacha.bhavsar@oss.qualcomm.com>
 <20250722201404.2368507-2-vacha.bhavsar@oss.qualcomm.com>
 <875xf36qyk.fsf@draig.linaro.org>
 <CAFEAcA8o4wEHHDXVj0Fcc3i8g+49psY7YSf1AqGiGe9vNuXiQA@mail.gmail.com>
 <87ikj3545v.fsf@draig.linaro.org>
 <CAFEAcA-Y7utLb9cciGJOVAPF8Y0W4RxcOLDnNS7ptpHtYVG_EQ@mail.gmail.com>
 <CAEWVDmsOD-vNc6YbwfND9yzfz-G8kEsFfpEtJ5A+duhUzGU2Pg@mail.gmail.com>
 <CAEWVDms3R+_dv79GTdmzbJBJ3rb=hSi7rRj=f4rzRFwsHnzXJg@mail.gmail.com>
 <CAFEAcA_Q-MhmFNvXUwUXF2_MJqHxujPL7C3=PxC8=hMprerDxA@mail.gmail.com>
In-Reply-To: <CAFEAcA_Q-MhmFNvXUwUXF2_MJqHxujPL7C3=PxC8=hMprerDxA@mail.gmail.com>
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 15:37:13 -0400
X-Gm-Features: Ac12FXzkirCQSzrqBa8EGJFIE1R_sCI49lZB169IkkBVUMG83req9LEARYgGmNs
Message-ID: <CAEWVDmv3ZCs8tW0pzH0sX_SUOdj-fyFwVz0uSRowziga=hCF1Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] target/arm: Increase MAX_PACKET_LENGTH for SME ZA
 remote gdb debugging
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000884853063c1c0dc0"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX0SeEh29tOlrE
 X0u68uMRJMZPOszuvIHdIYjXklbYKH/vGIThiPUGPs8RqpVXXxm0mR14VS/PJllAJd7HV2X9i7B
 TkdTwaphlfajtdbzSSUlid5uo0Oyr2jPRwESNjjBnKd1X9EIskz0MIbKvQ07neelK1AG290OHsI
 FrSG7s1+eRDswO0/uT6u7gd2/DQsyyyeY4p6FZhy5wz+SScBm4/5c5TtzWnVNpGVKvvMJ+hFvFm
 6lWmuVDMOyullBI+eXN7lnWe3KXwzKyP7a4zn4CFe46//h1Of7HT463+X9FwXC55KW1Z7azzcom
 JMI2Zv+0Dg/j2W5rAA1uAvCwy5Nf1Q2T4aNoEqAeGOtBGIvWFoZH2uAkNZrQjdvMGIC6IUXRr8z
 HkgdxgJh
X-Proofpoint-GUID: Q-BHm319OMxIWonNyXnyMDhdutpYneAr
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689a4679 cx=c_pps
 a=5rZgxjGdQ1phXw1xqkF1vg==:117 a=2OwXVqhp2XgA:10 a=tk1fAI5CypgQKhaZt9gA:9
 a=QEXdDO2ut3YA:10 a=VWM_7Ik0QpPsEaYKe28A:9 a=FvMT9AR2qkiEEVpopuB7:22
X-Proofpoint-ORIG-GUID: Q-BHm319OMxIWonNyXnyMDhdutpYneAr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000884853063c1c0dc0
Content-Type: text/plain; charset="UTF-8"

Hi,

From testing with a max vector length, the minimum size the buffer needs to
be is 131077 to survive the worst case of a P packet with the ZA register.
This is enough to fit the whole ZA register plus the overhead for the P
packet (command + register number, the checksum is not stored in line_buf)
and the null terminator. I had overshot and rounded it safely to 131100,
and it seems gdbserver has done the same thing but they specifically
counted 32 bytes for overhead, it's not specified why. So the 131100 is
large enough, however I have changed it to 131104 just to stay consistent
with gdbserver and have added this note to the comment you've suggested to
be placed above MAX_PACKET_LENGTH. I've also changed line_buf to be a
GString as Alex suggested.

I have sent a new version with these changes. Looking forward to your
feedback!

Thanks,
Vacha

--000000000000884853063c1c0dc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>From testing with a max vector length, the mini=
mum size the buffer needs to be is 131077 to survive the worst case of a P =
packet with the ZA register. This is enough to fit the whole ZA register pl=
us the overhead for the P packet (command + register number, the checksum i=
s not stored in line_buf) and the null terminator. I had overshot and round=
ed it safely to 131100, and it seems gdbserver has done the same thing but =
they specifically counted 32 bytes for overhead, it&#39;s not specified why=
. So the 131100 is large enough, however I have changed it to 131104 just t=
o stay consistent with gdbserver and have added this note to the comment yo=
u&#39;ve suggested to be placed above MAX_PACKET_LENGTH. I&#39;ve also chan=
ged line_buf to be a GString as Alex suggested.<div><br></div><div>I have s=
ent a new version with these changes. Looking forward to your feedback!</di=
v><div><br></div><div>Thanks,</div><div>Vacha</div></div>

--000000000000884853063c1c0dc0--


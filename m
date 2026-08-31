Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD79C61DE8
	for <qemu-arm@archiver.kernel.org>; Mon, 31 Aug 2026 05:58:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0v1v-0001Ev-8F; Mon, 31 Aug 2026 01:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0v1u-0001Ed-4J
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 01:58:02 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0v1s-0003Ji-Kc
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 01:58:01 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V52Zr61445360
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 05:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MoqxbOQCfjEwpg/ycetY0CAnxspLVzZb/EnIYQW1QlM=; b=ec+n5sV21RN/cHn0
 +QqF0o2Du18YNYDBBDUc7iuVABAOFouj54JvdecDUj8ruvPopKlGfQn0MO0djugI
 BTsXyV9nYNBQwO6fbpZ3bY5D4KDcCYOT15ICcPEsugWObNg2wri9OwtE7kGBHCEH
 qoKRKLxZhBlHbdl72RrBSwT4kgPjcGilQQRC7SkGP3hCN0sicIoY0PVVNZbTiBPY
 ntjYvbPFG0v8aVveVg45yXj/ASAJj7bP9N+QDp8Wgi4aQuSnmJYGwLQbsQoBgEs4
 2PnSDCMQFtGYOTIiCkRwP1jraZqou7lPmeQeNf+mV5uHpW3T35g3jxZbGbKyOnCO
 0Ruxow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgvky9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 05:57:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93917f4ccb4so328642185a.0
 for <qemu-arm@nongnu.org>; Sun, 30 Aug 2026 22:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788155878; x=1788760678; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MoqxbOQCfjEwpg/ycetY0CAnxspLVzZb/EnIYQW1QlM=;
 b=C9QqtK3uHtbjncaDXtpcy2I3Ux9nGLTtpYyVcUh0fAzmp7DmPrTtNnOQcdpvNtCbKN
 VnBhtpLBX76+73fny9Am6FWTPtjbX2T0emJqjukpcKzwWSWZcUe9a0m/tvxdgofP+vOw
 UNNvXC1YH5h1ORZA7f8WKCH1/BWbCtL1B1cRQGsQqhyN2oQcM8+tkzv807zu1eKzpEtq
 AiaxfdCTuTuZuEwykbyjTZquTkz0haUjh6exy1R5/w91FjgLoIpdi1P5hNmf4Ci/3+4I
 Uo1Pk/tTgttJ6LKDmPRRKOEO+c6N2ISxz3fB0we5p2Ul0nc14WyhdqHW5Jmi/I953RxI
 UvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788155878; x=1788760678;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MoqxbOQCfjEwpg/ycetY0CAnxspLVzZb/EnIYQW1QlM=;
 b=Y1LHtFuM+6ByE7pcE99Fi+7PnJiZW57X070OAbv69IV37T0R5VG4+5nVjGgHAgqALv
 i8EEQYZJvbs3ryB6FNCu4CwZZsn/KOsDXEA9716XHIeLjK65wrNrAP6bNXEZI+RbFhG5
 GuKPNYY2DEFDpMz3q1u2QEsbhjVXuYoRV7PltgdV3pMY6oHrq7lgn2qaRoTQnoSJOBWU
 H7tJv2V9g4RjrsQlBcLnTBslf9xoJOh4uIRktWJzQPLR+C5dAczwc0sAdFIJT+EakhUy
 bP4RKc3KCQha/caSfgEzUqMlDBRegKmNTbl2KtIodTG1YV5gG9gEmyVRPNEL8CaKp2Uy
 fHbA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrFsYep2jmu6K0gPTv5LstzLnt8tYYlw2HVzNc89igOWbMSol7mN/9w3f/fX0BV+2IHktghN5/n6A==@nongnu.org
X-Gm-Message-State: AFuF++kGf3j11qB7+ptFEd7xb3kkRKZNd53eSZmq9S8UjTBoDPQ0UQMX
 8MruFLcC9cRBYfVRHgi99WYLPTwUbNiasPE1mTN1TDMAOLAx/dfloQavX++mnXQv6NoO2UZ6+4U
 B8cvBMQM31CADHquq4vCdKWOTUQYhCaXJjfHhe7tMLssBWn7fSpcKfq8=
X-Gm-Gg: AR+sD11lYNVdS90X1lAtrxjZtZGOYRMjjbwLMSxlY9bCbk4gmutSzGev9n2ljLY5mb5
 BYUZ4TFdHQFFPMfsUklqHJXm5fgSt8/+yO+LIhpdllTj7Ke5M0uOkDRJTABhacAkEhVm/4ac25t
 NvpeXV/D1Ydt79LOvHFAzqVkudFjeVWP6w2QHuwECXhl0fjeeR43qF7s3/ovu5mbYdy4l/6SWab
 BKCoB8taY1GRLMz3xMfkJXNB1+S9kvrjcsZy9R6eQJPiYT0uls723zYkAT22MQG2KX/qnviePGu
 my7mUzT+/i+m+Reko5YVGM9/PW7N7I9vVBzNbz+B4iCDlPW5BTxT7axgzanLMbvfECC84EmbM+N
 D9WBnN+jsYp3YnN5VJlgHj6F9sd5NBeJXtw==
X-Received: by 2002:a05:620a:4005:b0:939:1483:55c with SMTP id
 af79cd13be357-939148316ebmr2404209785a.19.1788155877801; 
 Sun, 30 Aug 2026 22:57:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4005:b0:939:1483:55c with SMTP id
 af79cd13be357-939148316ebmr2404207385a.19.1788155877372; 
 Sun, 30 Aug 2026 22:57:57 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4843adf1377sm5363843f8f.18.2026.08.30.22.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 22:57:56 -0700 (PDT)
Message-ID: <c8e259b7-3b42-4dc3-963d-2ce8ee680500@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 07:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] hw/arm/aspeed_ast10x0: Remove obsolete
 unimplemented SBC mapping
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260831034153.192916-1-jamin_lin@aspeedtech.com>
 <20260831034153.192916-5-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260831034153.192916-5-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0OSBTYWx0ZWRfX68WAcGSG55OZ
 oy0k/Yrg/W/RreqWxhTlUb8LDEzcAlMZNcD+0NHZkzRrtYhK0z98GFjvvMocyH4RWk0+M+/a6NM
 2S5N1lRc2b3bBVqxh78Eoagcf4VAcpn4ZvVVFBu7DkV4olFH6VovinTRRfdjzFeYwVlIxYQd0Xg
 fbmC983AkqZzhM5JNJAqd7I/xmzuYdzF/kD6jtXkHWOd0rAacdAHtStTba/aWzDFleyt/86AYbi
 mB7A9zlVz8HA2B3seWSkhg2gs3RUpxhh4/ADB1urn/YOHlA33QB8VbkHmjrNGeDA6PT9uhrhbtb
 etn0cIIWy2ln6JtxAlzTjRa5Nrtk+Y05vhO2wCWzOgYDEeczHNk4RP7CNS9BZWwlo4c3lYoza8O
 +IpKzK3Nl5it2ERYLOY2qVszKk8woIEogwFsHGs5YbgWGKjujwKkrxRJNKlZNqxljIxDiXetZLF
 /w32amRxHJ0A33Y9Ing==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0OSBTYWx0ZWRfX5gh37Ylp24SP
 5wAOVkHzesWGO2EuuUKXBsNtA2iTx4gaMWr8qmyFGS9ZyK2nLYh7q0PdeSR048GHU8TpOb+UMt0
 KfCjmCQHedq0MDOlUh75+w1yqgWPa6s=
X-Proofpoint-ORIG-GUID: xnlEKicQr3GDn2Sy2CjaqAgWs-OrKi7H
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a9517e6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-GUID: xnlEKicQr3GDn2Sy2CjaqAgWs-OrKi7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310049
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 31/8/26 05:41, Jamin Lin wrote:
> The AST10x0 SoC now implements the SBC device model. However, the
> old unimplemented SBC mapping was left in place.

Since the introduction in commit 356b230ed13 ("aspeed/soc : Add AST1030
support") indeed.

> 
> Remove the obsolete mapping now that the SBC device is implemented.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast10x0.c | 7 -------
>   1 file changed, 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9523606A326
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5pUME3O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cj36dVVd
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOwy8-0003Gu-Fd; Thu, 05 Nov 2026 07:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwxm-0002vz-R1
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:53:07 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwxl-0005kz-75
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:53:06 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59tQvd1053285
 for <qemu-arm@nongnu.org>; Thu, 5 Nov 2026 12:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8RQFiS3B/Xrb3cheKwttSffUdesHjxQtQjW4IYgw7+I=; b=J5pUME3O35817qWf
 66Yz02BkwUhXmNovnID82dCwrRNkZpK9RpjqQVFo+Vztx6bcBNH7vgTqr7ncXGvZ
 CJHPnMlVyTGfMs3KJNLzrZevS79G04O6LsujraIR70AfbHcbPFVA1692GEwEDHJb
 sJuOvYCz7LWQLzRzeogFSnaSjtodcy0sGPISqAFcjVpmpKPBiG+bDMybRksCYJU7
 L0RAm93iwwgs3fEC9dNbHvrNmbhlaKyHC1XDOH1SccHnhz4r5ErWMKhXWcL+coyX
 X+cRaI3D6jMm9cYHhVtTumVyrT/OXXTUSD4YpkT1F92WthL1zvQLCGcqYpZgsdtv
 7C6Nzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f8s1c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 12:53:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f322ef7d3so420089085a.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 04:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883183; x=1794487983; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8RQFiS3B/Xrb3cheKwttSffUdesHjxQtQjW4IYgw7+I=;
 b=cj36dVVd2HuKQalJBKdcmnAPSSbAPIGQ/2cHqjZFS5rRcdFe6RU/PjlQEbVQOQWLKB
 qigO0HPUI4xslkg70K82kIowz+US4x5yEGuuIyMSuWalGiJb+heTMSO1uVoFeQad36b/
 OFRvhko/2C8t7C0sAa+wDSB98XGU9xqzilyXi+czSCzsTlJBwMMiENxd822s9yJIbGGf
 asXu2KZCmQ5LvFqey119n1t/AkpwFlPRIGl8QaqFKUng711f7hpPes3reBWIYaeNUBw5
 xHJG3kulnOynuTC6N1LHHGBz/zRM7SbgtbB+Md/4h5/OPn9L8AjWBfo38fbV+cHpm6JE
 uYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883183; x=1794487983;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8RQFiS3B/Xrb3cheKwttSffUdesHjxQtQjW4IYgw7+I=;
 b=CiuDD9zukaE6pfEY3DOTHrsE6mMaor8Dp8CICVrvQqwjEpGWcTqV418ekVEkm1xHAP
 imL4X3H+RwFj2ERDUjUK30nV7eUXw80IgQSrF8rRPu/QJ2Ju4liNXJob4O1cA1GEDarP
 RH+JS3sdNG7nmzt+r4aIVPkpQdTKyP4lNM8btm/VyALtMkyV1iLQTGL/+CmStyli+KPs
 MIW+DMhauyR5LD68gok9/pTszgvUQH1Zw2nYQEzDD+TwR5gbR/tU44IPC0bYZXeb8knR
 V0aa2dsB3DjSVA3x3Y17MhDgODtwBpQI8AigXl4282szv43z4ZTZX2a+dDGWa9KZahZj
 O2SQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzv+CHhDYwtVaW98RBP2GCxHILKI6smejOL1vVx1lOU3oIZsA9e7g8oinh5FKljPJnoiVAANU1eaQ==@nongnu.org
X-Gm-Message-State: APuU4Z+KbelLXAawfNZwB2tKe9CRk1FWNrDJwL/KVcckZ+TLmnV2Nuhr
 3ft7ziwrKLCTPrQ3U06bguBdWw3nXvH4xLb7L3SJY/gVFxcBSuckUD0jkUX6d3aLo1UQ6kHmy24
 t00Xq67zMuBs03Acj4t5JS0ncYA3xw+xPAbvBD5De00a7++ZIBChKNbQ=
X-Gm-Gg: AYBFou2Vnv48uVxF2gne5m3ukCV/JR1I/+XmUEEjVeEKEFLDLdng57k6hq6nC/shUIh
 Qa6NPLGyBHhjSEhmU0eU4lzB6Fjklfa+vfXNH9hGmAEpPVgH7YJ0EtQDjDCfipBqdie7at6r3jR
 BUzNa3CS5QzNMqz5mDTDvivGwsyJR3urqJdobxC7Uac6duwfqbn+IYUlEt4M4WNbFvUkQOm3yVR
 u0OV5Kn3DS8gAePfii0n5XixBmz8cchF4KUTTfGTWJLiavFX6PsOdDWHvecqa/fbnCl1mSOkafc
 9tqvNddw+uJO5QQVsFpkZkVSUuqtaRZV/ZFFkdxnqaPi/ePnRaFZZ1zwjKSNE+cX9ZzqXeG5Y2X
 +uytfVC8cDwvfsoMMIxcI9ojUn1T5kzCiJz6H8mJr2FXg6gp6iexj4BqyslnU8wyBL+++NMq0Mc
 tZskL0xAkhxX+tk5os5Bs5LYyc35BNqg==
X-Received: by 2002:a05:620a:a7dd:10b0:945:e74c:b1c5 with SMTP id
 af79cd13be357-945e74cbd3bmr107525885a.77.1793883183563; 
 Thu, 05 Nov 2026 04:53:03 -0800 (PST)
X-Received: by 2002:a05:620a:a7dd:10b0:945:e74c:b1c5 with SMTP id
 af79cd13be357-945e74cbd3bmr107524085a.77.1793883183080; 
 Thu, 05 Nov 2026 04:53:03 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b5719cd68dsm991650a12.37.2026.11.05.04.53.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:53:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH v2 05/17] hw/ppc/vof: Replace deprecated sprintf() with
 snprintf()
Date: Thu,  5 Nov 2026 13:51:50 +0100
Message-ID: <20261105125203.40320-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfXyfgevmlXKStf
 /bf8iGfpLxOfHHoUi3tkNVfwyXYkqXTCKSdQsJHpmkn8iUc9n2dLdAF05LnGE41rLxdxadw4Q0d
 go/oxzK6eaV1j5Dc57fRv7uMLxQIzVDBeJGDcMLxTI7KBKwnpMrQte4U6Xv4VUHOq1liDBNlwO8
 yomCOFGpi42vAsZeL7ppdGetXZ3RCC2RAhdWDh6y0MoeTysY4wBISciBtKAEz087P2KSoYuZmxz
 /4+M7D6Z6RUcs5byp7yGmrDRm5BdX1bDmk3boup3OnO1NLyAjKtwdxWbKBpFC45Ed4Fa7K9ofNz
 k3/N3QwQCC0YBJPtpNLI4YoVmoVg71AHWcg+bUrdKj14k8A9LYk+UngwYNyc5go/fFVW1I6xg8D
 NRBGL2ZD8cgMPk6FcePfOe1YdRr0fggqkWgUZHMqsCIa9y8Q8wxrNCsiBVBNaUzkSg47foO1jmT
 DOH54p//KSPoo1nwu9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfXz+uiFJRMIg8x
 MnnhxrfEGf4jOnV0Ygc34gi5XAKZ7SqSavh+k7Dp23b64yojWUPbB1Bzxms083hpTOcUxJB0V+S
 Lg07wn7UUQgWvJeeA5GuheH4VpXAG2c=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aec7c30 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IZgCprETnBKUNf_ylIwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: rYBAdCCCH3MkEd5J9k5GjX4MqKwo3ZfJ
X-Proofpoint-GUID: rYBAdCCCH3MkEd5J9k5GjX4MqKwo3ZfJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050051
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace sprintf() by safer snprintf() to avoid when using
Apple clang 17.0.0 on macOS ARM64:

  ../hw/ppc/vof.c:104:14: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/ppc/vof.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
index 873e967f1e4d..ef89b71f7336 100644
--- a/hw/ppc/vof.c
+++ b/hw/ppc/vof.c
@@ -101,7 +101,7 @@ static void prop_format(char *tval, int tlen, const void *prop, int len)
             strcat(t, " ");
             ++t;
         }
-        t += sprintf(t, "%02X", *c & 0xFF);
+        t += snprintf(t, tval + tlen - t, "%02X", *c & 0xFF);
     }
 }
 
-- 
2.55.0



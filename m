Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783DCC83F1A
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Jul 2025 20:14:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueJNP-0001jk-3P; Tue, 22 Jul 2025 16:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ueJNM-0001hs-VQ
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 16:14:13 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ueJNK-0001t2-Lf
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 16:14:12 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MGKOYj012550
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 20:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=nmnX/xKgSu+5/1cXpptovo
 eiAaGDzyx+sdbPmv2Icdw=; b=GzVIvFJjrf+nk+Hko8VuJCuwrtoQahn5kpiJ0p
 phZm9yGGaiaI8VjSsxz4Kd2bHZxaNjT8LOrJ3g6l4wpRWtmSAn8WzeZ2tk3m4HVY
 e+2KLHykxThmcsthwkEIF0azNwOrmKSeH/Ch9OPpPFbCl2zljGipgbVrcM3fyRue
 ct2qYvx57AtRAtfmm6Miv669I8nxl/mTCh7Pur7q7XH1H4zGZbu3nf6dnhxrKmg1
 0LE+o3VX0x372rDc7VfEUpGrZoBZtIxsStVNMhKVFivEWErVaX/wl6G8HUWDl3Mh
 AfSavjLRTl7jb1gw+lnxUhQ6ob/M5NSkfwSFywttP7Hdwl7A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6n176-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 20:14:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-23632fd6248so54556435ad.3
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 13:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753215247; x=1753820047;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nmnX/xKgSu+5/1cXpptovoeiAaGDzyx+sdbPmv2Icdw=;
 b=t3kGb7ai2j6rwnVtPDvBfQiPFKpbUn6ukZT5CeV6IB+Hjzp7Lq4TUHuNI19MsuGhgH
 vpIKjS35rkMbXd6NzonVud8Ec94+7/2NxShoTWVP22DzcTqvsAzZRZbRXdWGq3o0XASC
 3NfClzsT2qmpTVCuzaVFX9EgqJB10rEqzHldKXxr8cSilBFTR7YDJb2r3SmtaDRwSUUx
 DqCGfgez6BF5kOfNBuymSGQdYZKLDGEhEoudwOEw+cYE7jjxAUURlj3IqiChxvWkFb48
 Inp/XlzN/jGLJeahd5tuRnPrOYew7N6cp74zv+b96DFeTz99I35VhR9lvte6HopAlMXO
 k6TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJB/qnmuo+PLJSjqD/Pb2MaKQdsUtGk0qp4KP9q94GpCTWFRhRDddSSeHj8cxKCl51sY8IANKjEQ==@nongnu.org
X-Gm-Message-State: AOJu0YzNLkFXlrMI+TbDIWygo4hU+v7Wd4gGJxs0/Y8FZuCHakhzElEr
 5Z1+1w4ATs2KuhMFQHzN7sCOFgf4qIIuDezmvk1adOsskqOmWKBUCeJqQvdb1P6Jggupe/5KhIj
 rMDJPuilVcEg121KBzPx/2oJ/HBkGopaouxbjqykO6CiAXPmTBZh7Q3g=
X-Gm-Gg: ASbGncsYQKupG8CXFRLfMQCsEOf2hI12dSjC5t9t0AyoFWtxmQzk5gYq3u6gZz7LlSn
 A5TXDv7ecIqsCEV829gs5HXyDvmnCtEy7QKGI/0d299LHKb9NibOxT5q9MnQd8ZW+pK09cLqwV1
 zKI30lKg76g74m9QSt/tvdB6plsKbp8GY//pFpSvZ1kLHdqjRnk/5ZbFUGkOcQqxHU8YfsF9h87
 Rnj7xpVz/WoNjYqIPk6xGfbz6asrNkPsGoc7LAJ+aU2XHBoK+R6OGsL4TEtwl+LSaG3p7ACW7sw
 hzUVQ97aaTcYM+hi4eMwFFEN62goRjTfANDd8zdS31GsQz4mZkoP0a8c7I60MHPdQbql3eByHER
 IOVpLGSkZpHMl4c4=
X-Received: by 2002:a17:902:f64f:b0:235:c9a7:d5fb with SMTP id
 d9443c01a7336-23f9818d905mr3836515ad.16.1753215247088; 
 Tue, 22 Jul 2025 13:14:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjNCEfS05A3wad+yiqv5XGTIH+N7NOlUxBOo910SB4zJSkGzA48qYLki3rUSZeT53D3+y9Zw==
X-Received: by 2002:a17:902:f64f:b0:235:c9a7:d5fb with SMTP id
 d9443c01a7336-23f9818d905mr3836225ad.16.1753215246590; 
 Tue, 22 Jul 2025 13:14:06 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b4a9esm81917075ad.93.2025.07.22.13.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 13:14:06 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v4 0/2] target/arm: Added support for SME register exposure to
 GDB
Date: Tue, 22 Jul 2025 20:14:02 +0000
Message-Id: <20250722201404.2368507-1-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687ff110 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Q-dapHUw0VXFM7UNezAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: QT8_cxgLs45jsxzoYAYWmNNYeBXo_m5J
X-Proofpoint-GUID: QT8_cxgLs45jsxzoYAYWmNNYeBXo_m5J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE3NCBTYWx0ZWRfXwAIstFcGfAzi
 4/HIh/sDSreFhG160rRBVBvAXbkpjjOlGxwLM1W5eNJ9QR868S9cvMnZaXvJ5a3iH036Fki2E3i
 qH5pTIEqwrEf6uTHDzq4xmycXV9OdE3P1N9D6yYcrVnBIbXBfIoCvj9HtYm7z9c1E7qgh3Z2z6D
 X8wdGurTLDg07CrfaWBMpbs7HtcfQn7V8Q/fA05jvDFeQ36sCQueXg4Z3d3Ino2Bi0PABYmXmwL
 Lusg/zWkiYi//bcehGAbj8OtwuRXdhMdyH7CWbtcXaf64BvIwh7VjdiQEJBfghT7ps6RAqD2cHd
 xamrplxuwB/egCbWwMA8NCyMdzKnkr3jfBxFh/p8ycR144zTA60a3QDM4j8iYKXU6ZgUNOCcj5k
 C9+JgtJbSak/mrbU9SFf+kAm4tTCHbFu7hzMszqhPtwMnAntLlzq7yxT8cTtgr23ZWgkPNEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=606 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220174
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The QEMU GDB stub does not expose the ZA storage SME register to GDB via
the remote serial protocol, which can be a useful functionality to debug SME
code. To provide this functionality in Aarch64 target, this patch registers the
SME register set with the GDB stub. To do so, this patch implements the
aarch64_gdb_get_sme_reg() and aarch64_gdb_set_sme_reg() functions to
specify how to get and set the SME registers, and the
arm_gen_dynamic_smereg_feature() function to generate the target
description in XML format to indicate the target architecture supports SME.
Finally, this patch includes a dyn_smereg_feature structure to hold this
GDB XML description of the SME registers for each CPU.

Furthermore, this patch series increases the value of MAX_PACKET_LENGTH
to allow for remote GDB debugging of the ZA register when the vector
length is maximal.

Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>

Vacha Bhavsar (2):
  target/arm: Increase MAX_PACKET_LENGTH for SME ZA remote gdb debugging
  target/arm: Added support for SME register exposure to GDB

-- 
2.34.1



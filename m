Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8C6FEFB51
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 20:27:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vw4Qw-0004Xc-9c; Fri, 27 Feb 2026 15:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1vw4Qq-0004Wn-5t
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 15:27:30 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1vw4Qo-0005Cs-5k
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 15:27:27 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RH0IeO1365613
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 20:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Td16kqcg+TPRxFR+xlLquf80+8PBpCDG1LsZZ6CsW9U=; b=hZ27k1wejrXoPJbX
 yrhM+BD6SgIRL0dM2QRanRG/B5Y8dtVaYDSsL4zaHTfTpmwVneToJ9Q8UDX5Iykg
 t2qO5MsGQwyIaNZjcENl1JeRPc72F7xqT9Xlw6oh5piwJ9Rh3EnDAkcu7JNDHgub
 p2RzVPgH2vj6g5AaW35hNEyEHgdfSmTCbzR7xkwZjrnhBT2fooP9/f2eGBMvglU5
 Sq4P/H2SA/4ERegETheNQSSl3pK12p1amP77GVInHr8pv1XoPLdKLGi3iCgrcs2l
 Q/qahLfdsPxQNzxenCO2+fhTTdcc9SeDQkCZulGLZZWCIxIJ5Sb1L8pC0ewEubnc
 oULEbw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck9f01vgp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 20:27:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-1276e71652fso4604588c88.0
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 12:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772224043; x=1772828843; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Td16kqcg+TPRxFR+xlLquf80+8PBpCDG1LsZZ6CsW9U=;
 b=cDezr8Ba+X7jrp2IykCkez1By3z2Z11lqvVWdH5PsuNUqpmDnw/+yRMU84ZXFCn9H0
 VXapGYgROtS3hIDeNpM/2wxZlqkfwFaPr+7Qw7uaJRCcooYD8A7hKXARyJ9E+nt7gg2c
 wgVYETHkyjntr0Mlb7vjRXe7h4fhUvNl7HNCwJii43W+KB2klMay+veYVkOaMIP8TuoF
 VYiy2YEV7Sk5abUeLyU3N65qW8Gd7WX1G4mVKJq9uiWzzrd+TyQmsu50kEu68uSwEIEP
 QGV6T/B9LnEZ5e8Spsi+7z45nYsWt+o7daSmX4cGXoYEU6XqLepsbSnNDrpCsbWgepNB
 HcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772224043; x=1772828843;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Td16kqcg+TPRxFR+xlLquf80+8PBpCDG1LsZZ6CsW9U=;
 b=JMJO/KBAPw9zHc1rGfAPq7d3aY5B6sUFcZLihva0rlo/uokA0jvT5cIVysUjW6bg3U
 KaueMQt0xEo9LhhRbYltQEUZr3X3K0vDeB+LS0N4JmjyZf8LUrnyFAlNr+AKCAXYwsxj
 KUFymJuG9700H55Yhr3ag0QPh7PkPeW0YyRE3OAgY7ivfdRAfYRQLYMm7YMEUI/eerNs
 HkiNwiv0g0RXyomcpBKIXEURjTpH5oQtJ/k0HRzwfOTvN4r8f1XW3AJAyv4XnRovMFdk
 uRaC2qhN5viw6KEAVdffaNyafEs9vWcUO4FYKUP8j1gOG+R0CFNGM3JJY/vTFXiYF4Ed
 iRzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBziUpf4Eyv3987cmrpesuRfzhxgkJaEExhHDPAlyq3y0MYjqtnS+eDKgCJhjz2ZzhpO/F6YY7yw==@nongnu.org
X-Gm-Message-State: AOJu0YxfjaZYk0XCqyll0MeAZLHEGGy5HBQKleg0L6rpk34j2GFY0DNP
 KWNzHXwEsZ5m199cnBMl3mpyJL/S8np21eQyPNaJFzN/RxVFaqCNMl2clwU9xAiCeM9itoBfbf4
 zOMyWgH0gs7VKhNJQ2YgmdV4qHDqhopi3ptPch6hy91tpA47Jpx6sS5zf1Di/Haw=
X-Gm-Gg: ATEYQzxIr+82sbdy+OgAr9ySXRcWdGZ2VwX4hQjRrFVY8QJWSVDje7JNsyc5NZni5tA
 FXHWKSiwNNXgz3Oyspx2S/ZPMewkfvfpNK+wA3gpwo2L5tgTOpnzg6y71VD9P9wsqLgKQpavEpE
 sSokHFys76iQDNkPexSAeEtICGYoRIyJrUodUa2KDsNWnr3XN0bP8ghaUxJfUa+xO6xDaC9qwcO
 QxzL2P1okhLgj2KwTCB0+NVFnetjn7FBUWHkm6x01giNfPnMm618senxm5zOPYs9LKW/BepcPXR
 1chh9FAuRHeFFR6ctIdHwouc7aU89GYKgt4QzlwLTggl3n6VHO8WDwJRlLujeFvKv3VQpYD9cuA
 dlOhSAyqzUzaOriTXyLNbJiZ5FA9tbDf5kzkVUUCUJA8FHdOXs+AkShDvxUbbyX/VtPOAf3OP5B
 lAkg==
X-Received: by 2002:a05:7022:79f:b0:119:e569:f60d with SMTP id
 a92af1059eb24-1278fb606bdmr2073586c88.6.1772224043401; 
 Fri, 27 Feb 2026 12:27:23 -0800 (PST)
X-Received: by 2002:a05:7022:79f:b0:119:e569:f60d with SMTP id
 a92af1059eb24-1278fb606bdmr2073559c88.6.1772224042604; 
 Fri, 27 Feb 2026 12:27:22 -0800 (PST)
Received: from [10.110.80.16] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12789a32863sm5307490c88.10.2026.02.27.12.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Feb 2026 12:27:21 -0800 (PST)
Message-ID: <dcfa638b-fbcd-479d-aa1d-9b193b530d1d@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 12:27:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/22] hw/i3c: Add bus support
To: Jamin Lin <jamin_lin@aspeedtech.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 "nabihestefan@google.com" <nabihestefan@google.com>,
 "komlodi@google.com" <komlodi@google.com>,
 Patrick Venture <venture@google.com>, Titus Rwantare <titusr@google.com>
References: <20260225021158.1586584-1-jamin_lin@aspeedtech.com>
 <20260225021158.1586584-4-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: Jithu Joseph <jithu.joseph@oss.qualcomm.com>
In-Reply-To: <20260225021158.1586584-4-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3OSBTYWx0ZWRfX9R5brv4LHePp
 MBgsSiodQ+cb1v1uzSJGDPpwskO/yn7+jr7O4aHWsRIv5wNWdBKsKvvSWwr90w59BBNj3TmHii2
 aDM6mzNKLQenhKfga2zSTrY13ddrJ/vraPZEpH+xn/DiXr7XiC0sHlmCk55ACoXSEuTQcdag4GC
 /sIqpxQW7t/s/ZGxKoy8btgbIgh7YKsB0WNs/4z2FMPrbSJlNXfHKeq8rPwqcdvs3CvOONFs/NN
 rxkJ7nYahiqOlBK4LuTiEpBeLu93K2NcsDbuvYaGhrO/FA1so3l+jmIxSQPcNNR0HTJc1XBI4Ng
 48mKfBLPizG3TA2ZAx6OMOmge5OFlU2elEilzT44iF/V0qR6+kSlQhwYI0HjA1XeZa4HvcsIiyY
 0U+U8G3AursN5cGIy7692HL1zVlTS9qbh61UDhagUUKSBwPmOLLsrn4/73V+jYxDY7g1ZYXKtTB
 B4komB8w8KO1VU1v8zw==
X-Proofpoint-GUID: 7TgKJnQJLLwssCZC32z8txGdhl6XDLNa
X-Authority-Analysis: v=2.4 cv=bIsb4f+Z c=1 sm=1 tr=0 ts=69a1fe2c cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5-m66uigXNRcoxOG-vkA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 7TgKJnQJLLwssCZC32z8txGdhl6XDLNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270179
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=jithu.joseph@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.706,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.401, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2/24/2026 6:12 PM, Jamin Lin wrote:
> Adds an I3C bus and a target class.
> The bus supports:
> - I3C data transmission and reception
> - CCCs (including ENTDAA)
> - IBIs
> - legacy I2C transactions

Reviewed-by: Jithu Joseph <jithu.joseph@oss.qualcomm.com>



Thanks
Jithu


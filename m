Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C32C624D0
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 04:45:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1coN-00008K-TK; Wed, 02 Sep 2026 00:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1x1coM-00006X-3j
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 00:42:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1x1coJ-0000Jy-6c
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 00:42:57 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 681KT9ja3108191
 for <qemu-arm@nongnu.org>; Wed, 2 Sep 2026 04:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 duQyVDjHvCwWfJ8/fDnqIo03r/fNqO+pyLmoWy36RGE=; b=hsXDBVyCG5hqKBrE
 zrJg4OoGnjC1NDKzjryifJov0CmbXV/DQirTRcTvSuZLJeeCq209Yo4JVpvL7KCO
 9J0HocrHSnOi1I0CVoo/EJy3VPQxY4JBS9bI3HJxg2E34+MB/czk2R2Rxc6WPrxU
 EXG3sP4bvYF+x4egjYNh0LML96F3j3UyO4wNmY5u6HkUijNS9le7SafsN5Hczlko
 fyEz+ZZf1It8mrHfCgDRhNRogQ+mu7+O68Fdocf97ta3grSTQTQc5xhzkDFYX0ze
 sE630gnrQ0d7vP37vLmSrXamWE+J67PeCWdSd+Jh/x724jNODOAAMndeRuRL2doa
 pJNVcw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wpan7b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 04:42:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cc1bbd7d6e6so731428a12.3
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 21:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788324171; x=1788928971; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=duQyVDjHvCwWfJ8/fDnqIo03r/fNqO+pyLmoWy36RGE=;
 b=FSdhJfdRIGAVVsIipPWxouuw1Uk7SKjvWTpiUKK4toXtzwjqjyyunsQ+Ymww37gzmN
 bPq1Nj4xDPSfjFCxNJS1CWHmoRdh8lKwgDXXi2ULxOdldp26vwf6glLEHSjLLguCfDIY
 zTuf7RGVa6J2ieXA2JThEG1L46jRoh7DpMyQhWlkD1H1TncBxiP92YI+WDSvRz0m4Bbu
 4OkxVIlpl++ayZvvLXVxua18u5UnW9VVDh4ZVODeeEIx+7JhNnaIHvzH4WeQECuVDq3Y
 JpR+4GD/31QHmM22rMGGm67H+hJlRayXLUMeJLCQ3cNH/9eWCsbxdFwbw3TBr3dIGttp
 6LpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788324171; x=1788928971;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=duQyVDjHvCwWfJ8/fDnqIo03r/fNqO+pyLmoWy36RGE=;
 b=rCNl9EKjbYn8XRzV7ulRrQzAd6QQ7tqc0g91loO40igHi2vfpD9a/Lmn5hnzUVDomK
 rFDEcPvEUSDRTkjcUFCHvQrqEiZfYijbxKHq1CCEbfXRAehlsBNS2nbdN5nAYmDlfvu4
 YsJWIblVoyduiLCLELMYQgxXxn3DhF31vJoU0zInMO/zKCwot/S1h4yvbwdkNpP/kSkk
 5Vdvv9hli0FgUS+IdqaMXjOWyM1kZTB7DaUwPob6Rj5staNyIYdVKMGaAWBFKLife1+2
 BjhZa50s7qvLgY8K5GQNZt88z0f4fZobFP1x1KTzI3qp+0A4s2ne+qFZtdQLhYqc9Act
 MuDg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrzqaXFmWMBFBZ3AuR1YW+cHnVqCTlj7/o7fdeu2UVGycG2HkmCcNDS447uZMbMwsOT60nS8yiviw==@nongnu.org
X-Gm-Message-State: AFuF++kfZCoNMHKTSI3+sHt0t2JHh5y4kr+DoO6TJEtaQu9EdMKb0Cqe
 Pnu9HMeMNOKPm2PSAegT6xK67WiNFZQcyp6eJFWDCIayiMI32LZvn9IhP2eaxkB8TaaYq6BS6ql
 4nHVYRkkqPT5/DNZ1Kb3RrJcVN/dwZy+J7O7R+aeoDWpG7R5ktllWIkg=
X-Gm-Gg: AR+sD13lUjx2C0UDCmpQrZ14r1II3L+hKk0lEj5mrjY0GMBvuE99+xcnayP2XBbRCNN
 QgQuwr4VpR+hMrxrbVcKaRGPN0BhFriIHOC6nLzqt7IKCnUVp4v+Wf2hEElY9RcahBkVNkslcYc
 YHlMFFK68YAsmpseID+Lvw0jdeyhbuvjM5O+0M2Jn9jVxHMjGZUik/OIFLcgZ+6IBltNysh5cjO
 ix860qOGs/8CO+Oh0JJQ+5TFyaYiHMqjvvz69s1kZfvS+Ni2qrCTfW7NKat5Wpu4QONFig3VaCK
 ZKFtvVB923xjklD4OP8OGMJ2fI+5flUhoYT3cBrklS5pKMPj8d5hYao2i042eT+qmFzkNC/w/vz
 wEUiSq1RLB6VzvQQNaPK04wy9Jb3fbFSDrB+onEPrpGtRMQRV
X-Received: by 2002:a05:6a20:9392:b0:3d3:ae1f:d7f5 with SMTP id
 adf61e73a8af0-3d9afe1762emr3031897637.21.1788324170380; 
 Tue, 01 Sep 2026 21:42:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:9392:b0:3d3:ae1f:d7f5 with SMTP id
 adf61e73a8af0-3d9afe1762emr3031847637.21.1788324169936; 
 Tue, 01 Sep 2026 21:42:49 -0700 (PDT)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-32f079c33e9sm2933984eec.4.2026.09.01.21.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 21:42:49 -0700 (PDT)
From: Brian Cain <brian.cain@oss.qualcomm.com>
To: qemu-devel@nongnu.org, richard.henderson@linaro.org
Cc: brian.cain@oss.qualcomm.com,
 Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PULL 06/28] semihosting: add callback to set error
Date: Tue,  1 Sep 2026 21:42:09 -0700
Message-Id: <20260902044231.843004-7-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902044231.843004-1-brian.cain@oss.qualcomm.com>
References: <20260902044231.843004-1-brian.cain@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a97a94b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8ndNYmkutmpv_8xOvXsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: QHpbvSY6zlbkEdeqoVZ-GmZYANocomlG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0MCBTYWx0ZWRfX38PCaXrREfwo
 l/b5moqhc5BABtek9j2j2+zdN0hweoO8OMHpWuoRK8H3RXXQtnlq2JJNf0Cmhum/Y/y61hGa+1A
 k9h9QXWCejKPz3ONh9eNNMLKeW8ZPI0=
X-Proofpoint-ORIG-GUID: QHpbvSY6zlbkEdeqoVZ-GmZYANocomlG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0MCBTYWx0ZWRfX+87E6N4QqqBB
 IeDUWXimWG2dAtGZdqqM/Q2ILLTJn+b2uhJDdIxK8kr1S9K8MyiTQA/tm5Js2KI/4CuvVcq60h+
 0bX63vHjaHsvYeUDX2EhCazplZLnk32oP+Edvu1YRbKokkkbUekErcg2AzXl+LZVwIpNARf5RHC
 9VQTnRCVmViVGpR/nxuvOOKSSuztqawoK0xZwmEWHJJxgXdu5Zpc+pi34mLGBFpb8tZjfXfYKja
 LTRTdvMWmVxOe1wXGFkNXmtCbLfYATwo3JFFV5M6imggZ/kevSP4hEJ+tmOI1SpFc07PZbReJIF
 0GmalooVzUSD9z1a5XM9lUrMkbwub7f51h7g5gxjxp5x/B/rj2bdZDOE59BLju7oxkmO7PiNJ7O
 4phI/UfW4EXtxPVVBvnb+VSv3HBLZdFaZPDh8HrqRpwIg/lRsEtVLDDvlE8prslS/t1mKkpYSYP
 RC5VZJswdyJ888ftf5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020040
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

RnJvbTogTWF0aGV1cyBUYXZhcmVzIEJlcm5hcmRpbm8gPG1hdGhldXMuYmVybmFyZGlub0Bvc3Mu
cXVhbGNvbW0uY29tPgoKVGhpcyBpcyBjdXJyZW50bHkgdW51c2VkIGJ5IGV4aXN0aW5nIHNlbWlo
b3N0aW5nIHRhcmdldHMsIGJ1dCBpdCB3aWxsIGJlCnVzZWQgYnkgaGV4YWdvbiBpbiB0aGUgZm9s
bG93aW5nIGNvbW1pdC4KClJldmlld2VkLWJ5OiBEYW5pZWwgSGVucmlxdWUgQmFyYm96YSA8ZGFu
aWVsLmJhcmJvemFAb3NzLnF1YWxjb21tLmNvbT4KU2lnbmVkLW9mZi1ieTogTWF0aGV1cyBUYXZh
cmVzIEJlcm5hcmRpbm8gPG1hdGhldXMuYmVybmFyZGlub0Bvc3MucXVhbGNvbW0uY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBCcmlhbiBDYWluIDxicmlhbi5jYWluQG9zcy5xdWFsY29tbS5jb20+Ci0tLQog
aW5jbHVkZS9zZW1paG9zdGluZy9jb21tb24tc2VtaS5oIHwgMSArCiBzZW1paG9zdGluZy9hcm0t
Y29tcGF0LXNlbWkuYyAgICAgfCAxICsKIHRhcmdldC9hcm0vY29tbW9uLXNlbWktdGFyZ2V0LmMg
ICB8IDQgKysrKwogdGFyZ2V0L3Jpc2N2L2NvbW1vbi1zZW1pLXRhcmdldC5jIHwgNCArKysrCiA0
IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3Nl
bWlob3N0aW5nL2NvbW1vbi1zZW1pLmggYi9pbmNsdWRlL3NlbWlob3N0aW5nL2NvbW1vbi1zZW1p
LmgKaW5kZXggYWE1MTFhNDZmNDIuLmExMTkwNWVmNGVmIDEwMDY0NAotLS0gYS9pbmNsdWRlL3Nl
bWlob3N0aW5nL2NvbW1vbi1zZW1pLmgKKysrIGIvaW5jbHVkZS9zZW1paG9zdGluZy9jb21tb24t
c2VtaS5oCkBAIC0zNyw2ICszNyw3IEBACiB2b2lkIGRvX2NvbW1vbl9zZW1paG9zdGluZyhDUFVT
dGF0ZSAqY3MpOwogdWludDY0X3QgY29tbW9uX3NlbWlfYXJnKENQVVN0YXRlICpjcywgaW50IGFy
Z25vKTsKIHZvaWQgY29tbW9uX3NlbWlfc2V0X3JldChDUFVTdGF0ZSAqY3MsIHVpbnQ2NF90IHJl
dCk7Cit2b2lkIGNvbW1vbl9zZW1pX3NldF9lcnIoQ1BVU3RhdGUgKmNzLCBpbnQgZXJyKTsKIGJv
b2wgaXNfNjRiaXRfc2VtaWhvc3RpbmcoQ1BVQXJjaFN0YXRlICplbnYpOwogYm9vbCBjb21tb25f
c2VtaV9zeXNfZXhpdF9pc19leHRlbmRlZChDUFVTdGF0ZSAqY3MpOwogdWludDY0X3QgY29tbW9u
X3NlbWlfc3RhY2tfYm90dG9tKENQVVN0YXRlICpjcyk7CmRpZmYgLS1naXQgYS9zZW1paG9zdGlu
Zy9hcm0tY29tcGF0LXNlbWkuYyBiL3NlbWlob3N0aW5nL2FybS1jb21wYXQtc2VtaS5jCmluZGV4
IDVlNWYxODFiOTA4Li5jNTQ3NTNmNjk2ZiAxMDA2NDQKLS0tIGEvc2VtaWhvc3RpbmcvYXJtLWNv
bXBhdC1zZW1pLmMKKysrIGIvc2VtaWhvc3RpbmcvYXJtLWNvbXBhdC1zZW1pLmMKQEAgLTIzNyw2
ICsyMzcsNyBAQCBzdGF0aWMgdm9pZCBjb21tb25fc2VtaV9jYihDUFVTdGF0ZSAqY3MsIHVpbnQ2
NF90IHJldCwgaW50IGVycikKICAgICAgICAgdHMtPnN3aV9lcnJubyA9IGVycjsKICNlbHNlCiAg
ICAgICAgIHN5c2NhbGxfZXJyID0gZXJyOworICAgICAgICBjb21tb25fc2VtaV9zZXRfZXJyKGNz
LCBlcnIpOwogI2VuZGlmCiAgICAgfQogICAgIGNvbW1vbl9zZW1pX3NldF9yZXQoY3MsIHJldCk7
CmRpZmYgLS1naXQgYS90YXJnZXQvYXJtL2NvbW1vbi1zZW1pLXRhcmdldC5jIGIvdGFyZ2V0L2Fy
bS9jb21tb24tc2VtaS10YXJnZXQuYwppbmRleCAyYjc3Y2U5YzE3Yi4uMzhkNTJkZWIzZDYgMTAw
NjQ0Ci0tLSBhL3RhcmdldC9hcm0vY29tbW9uLXNlbWktdGFyZ2V0LmMKKysrIGIvdGFyZ2V0L2Fy
bS9jb21tb24tc2VtaS10YXJnZXQuYwpAQCAtMzQsNiArMzQsMTAgQEAgdm9pZCBjb21tb25fc2Vt
aV9zZXRfcmV0KENQVVN0YXRlICpjcywgdWludDY0X3QgcmV0KQogICAgIH0KIH0KIAordm9pZCBj
b21tb25fc2VtaV9zZXRfZXJyKENQVVN0YXRlICpjcywgaW50IGVycikKK3sKK30KKwogYm9vbCBj
b21tb25fc2VtaV9zeXNfZXhpdF9pc19leHRlbmRlZChDUFVTdGF0ZSAqY3MpCiB7CiAgICAgcmV0
dXJuIGlzX2E2NChjcHVfZW52KGNzKSk7CmRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvY29tbW9u
LXNlbWktdGFyZ2V0LmMgYi90YXJnZXQvcmlzY3YvY29tbW9uLXNlbWktdGFyZ2V0LmMKaW5kZXgg
YWVhZWI4OGQ1MzYuLjM4YTAwZTE2MGMzIDEwMDY0NAotLS0gYS90YXJnZXQvcmlzY3YvY29tbW9u
LXNlbWktdGFyZ2V0LmMKKysrIGIvdGFyZ2V0L3Jpc2N2L2NvbW1vbi1zZW1pLXRhcmdldC5jCkBA
IC0yNiw2ICsyNiwxMCBAQCB2b2lkIGNvbW1vbl9zZW1pX3NldF9yZXQoQ1BVU3RhdGUgKmNzLCB1
aW50NjRfdCByZXQpCiAgICAgZW52LT5ncHJbeEEwXSA9IHJldDsKIH0KIAordm9pZCBjb21tb25f
c2VtaV9zZXRfZXJyKENQVVN0YXRlICpjcywgaW50IGVycikKK3sKK30KKwogYm9vbCBpc182NGJp
dF9zZW1paG9zdGluZyhDUFVBcmNoU3RhdGUgKmVudikKIHsKICAgICByZXR1cm4gcmlzY3ZfY3B1
X214bChlbnYpICE9IE1YTF9SVjMyOwotLSAKMi4zNC4xCgo=


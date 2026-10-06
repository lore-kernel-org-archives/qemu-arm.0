Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395C6CA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 07:29:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEM5G-0002IY-5J; Wed, 07 Oct 2026 03:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEGWr-0004P8-M5
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:33:27 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEGWW-0007yp-3p
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:32:58 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6967Siul3537852
 for <qemu-arm@nongnu.org>; Tue, 6 Oct 2026 09:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9Qzr4xM8E/Ol0WnTSww3Y31WWioP3XMsHKf6j+JTpC4=; b=ohPAKj1bPFn6akLO
 zlhLv+OxDhirruBHwtGLD+khWbUPyrmUAI8E2K1gbG7brvm3KXlbGID1sgBRD1YW
 zI+yVSh8hsN2y9FfXePIS0QbABqQXh3/I8nmVaXriDBQ49Y/sEBFhNuVvg2DrHFp
 900dLoT1JbV8K6W+sIRAE7Vw566Ox9BMq4uBMR9hjq9fUUbZFJHG+u4+89hRDBzQ
 ZqYsgeII488z88UpBtC1/KzDo1F3aDo4ew5K7SpWQJyQs4Rf8NqlW5zYrUWiLGgl
 cwK8f1TH+EGP0fNALPL0C3ddI4BBDq+jdwDgRsOhgUXN4dwAsaDTQgByAE/fO1LJ
 gXsXBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4vmrrd2w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 09:25:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93e49a1d3b1so607083585a.2
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 02:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791278730; x=1791883530; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9Qzr4xM8E/Ol0WnTSww3Y31WWioP3XMsHKf6j+JTpC4=;
 b=T+KSUmc+edvE0DlLD5yiRtTDBQ0+n53SdURoDGHq4t5tdjEn/bAwJeUbdmF0WdelUJ
 MlFSMCo/NDVKbwQldHawI33Hf0kBqli7B3yfYbBVl93RtnHyBnFDoC5Jy4TGDNSA8nHU
 n8nSyxWXZgyGmw6Sqsvjj41vWz9BS9/oZXqh5UQob+LUmz1SqTlLo37UkunwRcqahBwf
 lcbDHNxfSBFy6QAWvN/AGnxs6SLeUBK3CKpzXXyrXC1bbHQgOmH2fY8lvpQWeBPNu3p5
 pUKsH21ld2nXFCud+9HsngQKSQbKlxWSP2BjHoEmHxrSHywj/gLLmNB8z33OkzCafiEU
 WcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791278730; x=1791883530;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9Qzr4xM8E/Ol0WnTSww3Y31WWioP3XMsHKf6j+JTpC4=;
 b=DuGGrz59bLbO2vSfw1+dDkA9zmNAhPW0kBf+xvhEdtu5XRNN0SrQh38nf5ml9BbwW3
 WtsgQdPdHrDUtawmFzyn7UDoOJEN6diIgBzIQCBK99s+TUqh3wosznbm2xd+6+WIHYLm
 JmPjfFi06rRNuBo5slMwl0g62/p4XmiOwbacjGProkh3BE1sbblyFhUEMSGdqjuEk6v+
 NwUuYPq5eMeE9qLC45Q6cEwcrEla+kq9IfvpFlWn8bRKise3rHsxd7FBOZeMFCu3ovWN
 qyvM0KQHLijJCQ93MEjO2wP7IVpOQmPOkXS5Trh6Ju5ROfJc9FCxitUUfE3QT90tOQgj
 2g0Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBzk9iEszEbuLHd8Y+Z1wvbNLO3To6X6cTnDMLwpM4RZ//Gz56JcKtz6XkOBTrh6lAZaCsgTPMZ3Ag==@nongnu.org
X-Gm-Message-State: AFuF++lALKSyGpSjseN+sf/USZn/VV5QkvnMImD+fWPuH/MIBJaRqG8G
 P8ZZBgN/XSs1rxWvQtOn6j74MCfFubed2IFW2C4LiYtqv8ahQF5+QB+2b77zZGM60xbv9CcGd0r
 vhuupExdZyPSoZFw8Snvw5q6wRFyTTZxP1B5HtBBAMx/Gq/+BgP9nHJ4=
X-Gm-Gg: AYBFou0kDg4eMpoY6ZbYljNmUGS54Vmb5H0KmqOSKVxhuFEaGoqjihRIFvWU+9CxFs0
 0ndaIAxNH1raYfTcbPvwFQnhSizqaf6UAmczWy9qxKY0zXWADkAqThIi4hXoHmUSE1eMFyakeDn
 6zk12WIe1GGaK0fG1ArF9qvR9G2uQC+ZXiBksQko09iIU0dYA93UMqB/M1iTYLWCG9tg/olGfZG
 g38IP41CmHqiNmijcGfRb0oEC/4rSD96n6sNWQJG2/gSaqfMz5YYpYHzhfFkwpnnUYSq3l4xh3u
 e11T+CGE3Az3k33oKoScil/lrRv4ZefnajA7T3nfU7xmTR/DH20FWJW5QZKo8YYfyzS4IntLGUS
 6mj9H3JtDcfGm0DRdXNjMa6bfmtH6vy8/gA==
X-Received: by 2002:a05:620a:2a08:b0:93c:6092:ac66 with SMTP id
 af79cd13be357-93e8f351d75mr132877285a.24.1791278730274; 
 Tue, 06 Oct 2026 02:25:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:93c:6092:ac66 with SMTP id
 af79cd13be357-93e8f351d75mr132874885a.24.1791278729864; 
 Tue, 06 Oct 2026 02:25:29 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a166bfaf73sm216094065e9.4.2026.10.06.02.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 02:25:29 -0700 (PDT)
Message-ID: <d62debe0-bc73-47be-8b0e-f7f3496b4f0e@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 11:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/31] hw/arm/mcimx7d-sabre: Have 2 CPUs and 2 GiB of
 RAM by default
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20261006083445.30362-1-shentey@gmail.com>
 <20261006083445.30362-11-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261006083445.30362-11-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XZ4cX455 c=1 sm=1 tr=0 ts=6ac4be8b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=FRSEYCzRAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-GUID: AyjL0CsbR_fERmjtSK24ngnyVBY4ikuf
X-Proofpoint-ORIG-GUID: AyjL0CsbR_fERmjtSK24ngnyVBY4ikuf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX+XAhqz6wTcSl
 49OjLPDabIdxMWx7u0glAxHBcfyXIUJTiRtW2c2bm/YfTyz35gPJ/cZkUNqh9c6NIhMB7vPfErZ
 Ov5jcurRD+enWn54MjKaHzixRTquJwUQI3Yu5fFNJIFk0xo/jlM7v+Fs4Uo3j2Opc3V3Wutzkpo
 EPyrqLVHyjJS8spyxMOBPF72GRbdobxmzq5LurUyo317Jt56hCZRiNQaER4lbSwHfUp1eiu6hI8
 EGYy0b9K6lI4Newrb6nDnl8jbiZNFTkTUyKUQvfPd6DxausMcS6Z1G8DOm0JHWfO6ftHOd6w9d1
 U32aogdMmvA0Hjs7ct8GPKyJ9+JhD0Cf7df76JVHRiQ7XIp7oyxVjnaQkUpyyW3yOrePk/PlInZ
 oR37kKofpM7/qE9W6xxF8WT/0A4KXsOmfDtCp4daXbiUIxnK0eIyEzHx1GBrYh9zfoPWAoWyXtw
 CgLlcfqn2ICp0zH7gAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX62mv501AqHd3
 KzIVNiB6fAtfTUMvln0J9Mxe/uEsfe6g0CWqF6fp2YJpOYTHfM33LaRuqtLf1G29OZmcUSIcIQr
 e3O9t6GbupV3Jy1EceMXrwUbgl5VCD0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060037
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 6/10/26 10:34, Bernhard Beschow wrote:
> Having two CPUs and 1 GiB of RAM matches real hardware. Fix the machine
> defaults to make its use more ergonomic and less error-prone.
> 
> To reproduce the old default behavior for e.g. migration purposes,
> `-smp 1 -m 128M` needs to be passed on the command line.
> 
> Reviewed-by: Bin Meng <bin.meng@processmission.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/mcimx7d-sabre.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


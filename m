Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08940CD8C9D
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 19:47:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXlMf-0006ks-Aq; Thu, 11 Jun 2026 15:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXlMd-0006h0-B3
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 15:46:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXlMa-000262-Sy
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 15:46:55 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BJ3Ios1388712
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 19:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aNQ7+b7zsuOFuDbr+kHzEE3wVmJ9L0MHXUrmbqbPpP8=; b=LAJYPkpuULWk21WJ
 HavK4D3CQcKkEgTinIkXQOvGfAoqOJQJIpIqRexiXxEGTBRgM15IahNy6M8SuhTg
 rgdMupEcI+nZoPThWuV847VTp8Vp6hEUXOAiWX2gU+q9jf0MbzlPInxPAVcKR7JP
 ts0ayqvMV5T8utEGkeY9sEHIP3ooMOn6YH8qCe1SQ0XrW781EWUVEs6y+TpPGGPO
 ekdhpJRz4oXuki/z78Xrg31Kkh9NScUOYS47W6SRu97s5WvTMb0eggFDk7+9wv2j
 UapEdOzfhDnb90XjzWsMgbCFdpSFIDOeTpwcAtw1wefcrPAlwrrNVohZvdGWLje0
 7Nb/hQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1658pgm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 19:46:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51772325a64so1862971cf.2
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 12:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781207210; x=1781812010; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aNQ7+b7zsuOFuDbr+kHzEE3wVmJ9L0MHXUrmbqbPpP8=;
 b=OJvHnzIoeGh2qj406evmhRkw6P3PmpvrAvDKPD9CkTeGKefJZRlUCOiC9PMWzszqSZ
 tATG4Bnwcp1H0PZEb4d2vdqNw7bpC8MyOFB099KjSO82Y9beWYU4NwAsb+TQBV6qrcwR
 PypqpVRscX54iAFdErVgJBieKTAguNXY5piLks9Bs+GxWLjTPxeXtB/c7h1tl+zkV+l5
 DeLR6AvESHr98eE7lF8RL2EBxBGLbU2diRo/LV0zuiW9hqE3zk+/dWi8rBCsQu81jrqm
 4Ztn1nckciRkZNCaI2gs9tA7bFJK3W+h0w9ujqgeQ1jVjTQMfs6p02FMzR5lnasbi8aF
 CPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781207210; x=1781812010;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aNQ7+b7zsuOFuDbr+kHzEE3wVmJ9L0MHXUrmbqbPpP8=;
 b=HeRDq2wo7hAzlAav9iIKGxWQZMYe9YDoZTdhGirYfMleX4fqZYBPN5TsxAUf6UAvmc
 IVqy5U/Q57KyveiUCdbG3/JKInOR5QC9ktz+KiIiiVjVC47S1r5ncPa1TZSb1kRTRjeJ
 iGWBwyDeGsDGwx8JUOAergCQlY3433DHbYG8SzWwwOFKpW0Go2dJl53+71jSIBKFwDbf
 QvF+Nadf8bFmWxJP8FxSyDcIPjeme5BaHxABlXLlbsD0RUzWoNLQsv6FQABnpcwoKKdg
 QEYOpDMy9ePfKCKUb32mwJdqn9rbTPG538YaEseRArpjVChVsP9wMHolPXNR+sBqQdga
 gArQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8/1p1Fdu3Jz4knnSlzYWVqN18BDfPwrDwmc+4PXQuorvcZT81bkX+l7CQQ7k4rF/PcTpU8zKuOxQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw98lRymrCI2AfEhY2tF5YocV4ymu/tgWxjE/+zz3CX/K+LEh0W
 BqLEy8uhwDq7eYl9IvdJehjMlwfyJKxRWakE1xRsAYe4L2AxnNQcnE6NCZuHIo/wknYzUzVS0+2
 joNJ8+dF8amSh4DfiM8KOouuiO2xvhgmt9X8X5jo5yohNJi2Xnpo9oYo=
X-Gm-Gg: Acq92OETdcs7UhBCtqCpkvWDUSQjzutEeDmIK6YEeEFffsMzd/EEFF2GIaeV/vUClcf
 XRi8fHGqWsWcqUKqSbRKZxny4viqNLMPlQ4PLJuZem3pzcUixpKw79jXH29ZDXdfPS3LSnUGh0+
 CgzKPt80MRH81WoTujQij4hnpzLtlWfAiO8/3eipOWzL1yKXACluA/m9WgEnaf1EdYLuiGjeTe0
 hWg+ULTkoSuYwVCbEfrdKomToU4+ZEFYVBUv/lQUKRO6hGOimEzONuzq26Oi+At8jq+/N56jgoD
 4+hNHgKUM2Cl34OYtpyEnKDFxnxx/BgJg3a4udjenHkPIz8aC3ImRfZ7zKtHBpSOMvbeTyncfqB
 sgUZjBW9z9nVkP2uI+lOmzNVvytCmryvtqIAcvCM90V447xgsDE/N/sE7evO5LPHG9RsZBCCq
X-Received: by 2002:a05:622a:164b:b0:517:9157:ecf0 with SMTP id
 d75a77b69052e-517ee1d6090mr63040781cf.29.1781207210335; 
 Thu, 11 Jun 2026 12:46:50 -0700 (PDT)
X-Received: by 2002:a05:622a:164b:b0:517:9157:ecf0 with SMTP id
 d75a77b69052e-517ee1d6090mr63040301cf.29.1781207209909; 
 Thu, 11 Jun 2026 12:46:49 -0700 (PDT)
Received: from [192.168.69.232] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606c0c2066sm2217346f8f.5.2026.06.11.12.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 12:46:48 -0700 (PDT)
Message-ID: <0835ad74-2a62-444f-881e-2a9f8dbd61fc@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 21:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/22] ui/input: remove old LED handler broadcast queue
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Thomas Huth <th.huth+qemu@posteo.eu>
References: <20260610-ui-input-v2-0-f68452dd6a22@redhat.com>
 <20260610-ui-input-v2-22-f68452dd6a22@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260610-ui-input-v2-22-f68452dd6a22@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5OCBTYWx0ZWRfXynXgu62sXGaV
 31yXHQIHkVUjkg05vMUSpKdNdQh9UKN85AA8ya6+Eb1eVQXbxq1wEfF4z5EPjQsUJfAHahHoG96
 4Myp66du3Mp9+ecl078ZbOdOcYEifJbxhvoznxPW8cYByjfKEdAEjpKv0RTQJ24sRFU0/jGg4x8
 +MSuuYQioWShS8aEXoXINFPtnj9taiAMdOZPDZEV8xY+M3DBfDZxsJLgXnbTBM3+gN6RlZLtaI+
 1Wnao+KFZDK1OPQrME+h0pDi0PFKX7/7PAs3gZeUAddqtpNb4VjhPBNy1+SSCIcfit2UZLuZwLi
 EYBEud9v90k4o4XNi0YYrsUBoFVjLQ47mDpnkV1V0ckdJ28f6oCcN8637Inth5KtOP3fhkotAxR
 8oJ+FyHjdNwCT1DrSBRyfch7CxInIcfduDmNW/WiBW66/gX4+v6gy/08fKIoyUBQBQQrrYtah4O
 djm63Fvn8y8mM4dkz9g==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2b10ab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 57ZJWHQbW7Y1QVaN5mespSIVm6ZLU1jW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5OCBTYWx0ZWRfX3/a2HO21uQrY
 LsQuN9Hthu6G6ZipwN8tLAgr1pLnRwBB7RO5CO75SpAh4kelLLj5L5iPFmHrmnsw3X5hDjmsFp9
 IatMpfb7CZ8P/5FJY3giclAJbOsnN6c=
X-Proofpoint-GUID: 57ZJWHQbW7Y1QVaN5mespSIVm6ZLU1jW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110198
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 10/6/26 12:57, Marc-André Lureau wrote:
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/ui/console.h |  9 ---------
>   ui/input.c           | 40 ----------------------------------------
>   2 files changed, 49 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A47606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 13:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nEUMwo05;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BucA+NEH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJWBq-0006xm-Gk; Wed, 21 Oct 2026 09:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJWBi-0006xM-RL
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 09:17:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJWBg-0004WG-0T
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 09:17:02 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LCouhi639721
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 13:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MFMLOU4cmP0CyfZA2OslwYY+g6yA1v2k0IIgGpUYFas=; b=nEUMwo05QwyWURpz
 4ojB7TY0L26Lmqzg12PnQ0A01wfGBWV2PCpbGpOCWNsI0oL+dBvBdOdGpdOkHD+O
 s0YEel01WkXwZaj2cY66Vd8eiqEEiKySAFfUJLSa4W3Tbni9iM/eJT9hyQXWJVKP
 2/v/I5xHuElug7D6pD1WqUd7TRxO0ojKiTXz9gKkNxxfGV2iAT3nr2/leAmq1Ect
 tHtwlQhT4ClLORZxxD0Ysxjsb+6ndjnY8mQFZ54xp3wJwauAFy/Kr5GxIAMey352
 yH9KON83fhwfHvN/XeNrE1afr3JQLK8T3QU4Rmf8p4GnpL6xyT8l6J/NXfguMyCW
 lJPBmQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r34kn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 13:16:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-988d5a1080eso561751241.0
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 06:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792588617; x=1793193417; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MFMLOU4cmP0CyfZA2OslwYY+g6yA1v2k0IIgGpUYFas=;
 b=BucA+NEHTW4BTBpZdaCgHXc4qPoa80iUka1gh0DO4HwWVbCOXzxjZmtmtrzW6V+oxf
 5qJVwWHSZH/h97AgAuU1G8gNUD6uvv86/PhSqlQuvT8wEJLk5E4mAsaZuWypAwnCCq5z
 TdAkBFanguq4ZXDbCWl48hQpXeFqn/TyUKe9CaaCTkQKeSUZr2U2Et1CpAPcTKp6nCQm
 DAXv/Xpaj2z9j51MDPTrnk02t/8CO+14HhE6EY6ZvuUpeH/XaiHqW6gQL+to4Hm+Zg/M
 A0RrC+4CW9jbGqLhpsqEomFlCcqYHXEY13w9vCXuBzK8HwT4/haSm++Bdox0rQPctoEV
 euTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792588617; x=1793193417;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MFMLOU4cmP0CyfZA2OslwYY+g6yA1v2k0IIgGpUYFas=;
 b=EtSaU7nkDB9+RCmvSCL0pwlmqOi4o3HnK+gaa4nP3zlTSGdXO7OSbm2hcBbaOz4RW0
 I406UWxCHASg3tpJO1loegvQ+QjjPHo8w/F6FSAIeyjyypmggKSOnqqlip2C3MUWtV13
 voPuaunaafZaLSSnGodWxU1WCj4UBdIG8DAEgj3RLXL2EgHuF2sToZJiAYuqlz+2jg/H
 ALD/wppdznOJNAtpZCaoO96qVHctxOYmukc2JjHOGLR1/GWm+z5/K5Azlcs0GIxYe3B+
 UI4Sv/rNktMJD3cqjns/JA5xYb5+mUvnMqkLsWweGu07VQWv9VFhoyKauH1d2Q2mRQKs
 I3xQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx7ViapUNfdna2oK9EaLgJx+gottymhCOlRdUeRjjW+S/ztpY5hMrYVzQPlon0ORfexfXCft8Hyhg==@nongnu.org
X-Gm-Message-State: AFq9FYKQfKAMeJEDOqJy34MLc2KK+WmdtCTB/EAzAJ2SRPVZhf+wiwi7
 C5CVvTXLiS1eak5nLrUIn7GTdAv6iWpe8XuqGiZdKvz/usQkDriZmK17VKL4+IotRZ7yk5wq/40
 K5nACXs64VEh10p6LGN2M4FoC/DRljE6nA9lNW5HXCaK6oOh3q43EhNU=
X-Gm-Gg: AYBFou1FZGAfBCLiSaV7AJ5ckWsUwdAJqJNcMRfsCJpjbUf0HtOkjszmdsTVJSM85wZ
 1S15MCzIR7feRdYwW6RG8iipppMmZstKYUcGjacz35vRrMlNf5j8dZnB+nKBdNNKeJzpj1IbRY8
 tjA/g0PEdUe/COhcJhWR68Fn4n1GkbmbltJuHrF7OR/p7gDPlehmPqJBghw5VRKqtCuJu9BeA7s
 wvJ5cNRM9DE3U8jJDjNHa9qy9xol0Ajbb8eHgkh3WTgOjBTxuDcq8FXuE0inPj+sbTX+/clEFN5
 bRCDF9NEKMrU7vpeRPET6OHjq7r+US7f/YL18Qxkq3d64D3INXtDnUDKSNbQPw2m78+jJTIZYdW
 +Vv1e6TdPtNpYDJG5r04xNwNxzpFMK9m7JA==
X-Received: by 2002:a05:6102:4191:b0:7cc:1dbf:a4e with SMTP id
 ada2fe7eead31-7cc92764e8fmr771878137.34.1792588617235; 
 Wed, 21 Oct 2026 06:16:57 -0700 (PDT)
X-Received: by 2002:a05:6102:4191:b0:7cc:1dbf:a4e with SMTP id
 ada2fe7eead31-7cc92764e8fmr771854137.34.1792588616704; 
 Wed, 21 Oct 2026 06:16:56 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e2583523asm5489145f8f.37.2026.10.21.06.16.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 06:16:55 -0700 (PDT)
Message-ID: <963636f3-2eba-46e0-a19e-0a85598ee0c4@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:16:54 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qemu-system-arm dies on introspection of ast2700-a1 and ast2700-a2
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Kane Chen <kane_chen@aspeedtech.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Anton Johansson <anjo@rev.ng>, Yonggang Luo <luoyonggang@gmail.com>
References: <87qzhjmft8.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <87qzhjmft8.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8bb49 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=x5dM4pBRUn_V6qr4VpEA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: IPEopzKdKwYj4OL0EossVzA0XnztHakn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MiBTYWx0ZWRfXx8S13pzw0RQN
 0TdBs6UyjEHQova3M0Xhu4F/VP80HFgm1mFLzTEN3MGOP4oSeULY3rs0Z+Vbye2InGIJSdFXwEN
 j+sCVgkldtbpRl86F37Dv2kzagIcQJ4depw2yff+BEq4YWV1jVPfcxh8L2yHoGC0iE9QtkOR+iZ
 35v9Ug+cjwGa+XBKD6P8iL9mLWafjCNWb5fvEiXMv52hxoewawwqFXcWrhJmM8lJxKVlr11RA90
 PFz3m3SyakI7jrkO7Q6TiD5Ftu8831Rwu8EqfULt6oxJXvysg44Uf4jvztGYPEoikANmyTcIjcJ
 C6reKkPtCECZH4lazov0BRc3/hCtxLFN6KMjsyqBj3nTrDWxagnD3CHZa8zfWejMJ3Vsbk7S82t
 spCEOxMv6iCe2OtxJjTKJUgg5+X1AaDDX3kZnpos18jNda9m5joSWSfV9BUo6OuiCdc+b3Y72qH
 CjFE8pG5CnSdU2KFncA==
X-Proofpoint-GUID: IPEopzKdKwYj4OL0EossVzA0XnztHakn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MiBTYWx0ZWRfX/PVQTnTOe54d
 4Fd3wYnzlTURnIWl/6rrm00UHhcU84MyhnD3BfMZB/Bk+pFyhOMFycAiT0EIVuXWZFM44tUe9PB
 LZ9mnp00N9zUiIQo33pQsJV7KnE136U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210052
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21/10/26 13:52, Markus Armbruster wrote:
> Watch this:
> 
>      $ qemu-system-arm -S -nodefaults -display none -M none -qmp stdio
>      {"QMP": {"version": {"qemu": {"micro": 50, "minor": 1, "major": 11}, "package": "v11.1.0-2545-g2d150b99ce"}, "capabilities": ["oob"]}}
>      {"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
>      {"return": {}}
>      {"execute": "qom-list-properties", "arguments": {"typename": "ast2700-a1"}}
>      qemu-system-arm: unknown type 'cortex-a35-arm-cpu'
>      [Exit 1 ]
> 
> Same for ast2700-a2.
> 
> I found the folllowing in their .instance_init() method
> aspeed_soc_ast2700_init():
> 
>      for (i = 0; i < sc->num_cpus; i++) {
>          if (qtest_enabled() && !target_aarch64()) {
>              /*
>               * Introspection qtest just want to create this object
>               * without realizing it. ARM_CPU_TYPE_NAME("cortex-a35")
>               * is not available on 32-bit binary: skip it since we
>               * won't even realize it.
>               */
>              continue;
>          }
>          object_initialize_child(obj, "cpu[*]", &a->cpu[i],
>                                  aspeed_soc_cpu_type(sc->valid_cpu_types));
>      }
> 
> This seems to paper over the bug so make the tests pass.  That's wrong.
> 
> .instance_init() must not fail and must not exit(), regardless of
> context.
> 
> object_initialize_child() exit()s when the type doesn't exist, because
> &error_fatal gets passed to in type_get_or_load_by_name() in
> object_initialize_child().
> 
> The narrow fix is to make type "cortex-a35-arm-cpu" exist, or to make
> the two bad types "ast2700-a1" and "ast2700-a2" not exist.

The ast2700 machines are hidden on 32-bit builds with

   .is_available = target_aarch64,

but the SoC types they use are not (see commit 89b5f1ed43f
"hw/arm: filter minimal set of machines" following earlier
attempt a2239a87339 "hw/arm/aspeed: Do not realize 64-bit
CPU types under QTest").

Pierrick, I thought this pattern was solved, can you have a
look please?

Thanks,

Phil.


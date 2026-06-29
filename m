Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6C2C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 14:48:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weDHJ-0001gV-EU; Mon, 29 Jun 2026 10:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weDH9-0001en-B3
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:47:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weDH7-0005Hd-OR
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:47:55 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65TATTit2592877
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 14:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0NHNyBIx4NXDX+zarE04sURnbo51PC81Cn6pCGW8Zrk=; b=kZbPRnuQk7ccH7Yw
 fM0ZA8Gjx5eV+VinvNLViYM0Dy+QtWvxCpBX8yb7k7nUX3fh/MkUkZmOgpjq02v4
 d/DkZcGwsSTNkIz/XgUb8M+MN1UHErPEdLBJV0jPQrx3GbGA+n2qdLRUAKKQXr1F
 MOJen1zPYMaVQNV7Q34x6sejxNwj61lWHWMWP9XVsKaHo54ZfkMwkAWeO1oXNS2f
 5SRSzWRJfaBp+51QnRFeBtX/x8/Rowrp694veMSbROn0h7eLJZpBGOpVUM5MurTo
 VwRnePpSle1AVfkmUpfzbiUtoVDTqzmnTomTRQ+wDdUR1Vw2+5Rn3QMg+g2bt9S8
 6iE8JA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vj74c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 14:47:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e5766dcb9so127203185a.3
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 07:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782744472; x=1783349272; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0NHNyBIx4NXDX+zarE04sURnbo51PC81Cn6pCGW8Zrk=;
 b=ekyOGlbC9CGyVwCxlDLMohUdpKSgXf3RJBtomJGe5uO6sUbjO21/Xq23YkdwAQWZnZ
 S7D5sKWNr9MNThYD1VQtmGlLlUiMgts/IvIyPrfl7kGP68Fe3fXqhG7mnUNoypTXyEem
 K3DZbSZq4Z++tw0KVeiRCkytnRAi+n2ckK9mqN0CZrb+Ehm37o0o+9wj9mrXKTddIQ6B
 wjm+4T7XY/6uusXHr24kJ1JV8ORcgNxkUXyWD3OmrngdSeBYJXWk9VdqWansYqKpW5dr
 yBickTQ53+vO+z/mU1dxorEbfaUg6AN1B4RYu4zqWvLk34usYGBnSQVylBdJYIEDagTe
 pO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782744472; x=1783349272;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0NHNyBIx4NXDX+zarE04sURnbo51PC81Cn6pCGW8Zrk=;
 b=d2PmNT79NfMiVjffvpf5ulTx6wwY7ISvf2t5y4drIqzCRcLABy+vjwFTSgXbdCmkld
 YYiuteqowNBPiFMOZHMlEP2tF33yxnVNmOq7cZnJswe/GfJKjFznFk7hTa1c1/jEP5p1
 Na82JYPmaUZaE8E9zgVkt/YbBhVbmKoZs8hUA2p3qumzVMX4RdNaET/k0FoG/o60DXuu
 VFhsDw2UL8eU1fwtf6KlXfr39CPr3SzhqWVGF/4wvIfgF2aDEnKSmNYK/iU0eoEASyXI
 ZeG6tNpYmgRl87IQXh6d3vgKJI/TZmw6BItGLp/zqOHwMFQ4U4FwdKKbb3QBEYR0LVL3
 b6mg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/1IoviThRl3vT33KETItEMcRE3I9QoaGZKm2JKMj12ll+qYrQJ9CCIIkDTxNIZS+U1lvv6n7OEwQ==@nongnu.org
X-Gm-Message-State: AOJu0YwnqvRLOCypRMnuuB/SVozz0EGk56e/tg3jiJrSeiShMBs3S4m/
 rVGEF6g4h9JhNSzeKHBTlC62nKltHns91PwEDOAcokVd3l9QOveM8Kxmspt5Lk8OiXm15+O7utR
 eX0lCeWXbSDucd5nhn//dxgWOnT0nfiixIQV6FRBTdnZUfNyGQmLTpLw=
X-Gm-Gg: AfdE7cl4RTLrsjfMtcKlQ4MVLLs87g4JCpUXXCQdj5mcE++lpW7uvegVQTSLhp05Dub
 9xTzKSUoX7Pa4xDj8eqCYP+ZyFjWgjpm73i/AMpYP2Wf2psXc1uVFu7QnsXMtqB72Ew4d9z8jGK
 YBfSwdBEimoe1xoYMR+YbRLYaQp+1XtoaVWe/n+g7VpuWR2RyGjHsGEo4IUebjJbqjnwaoXIzqa
 FFPjAPgmeD9DDMHOwKmh2XLT4rUVK9GaO+HhtavMxdANhX6qo82nKfMT7HEjJZIwLdqKcFoE44r
 wjHF6KiDmdadYfHfWWuW3J4PdZ3AXk8yCuTyZJUDPg8Ca2u7lHmWwlKQH0908uJNk8eCxt0BLOG
 q99Lc6LuoM8aFQdX7XzNssoa9lWB6aGE5vJr9IgjikSaLnNzGcZHmtHLGNFTOPQ==
X-Received: by 2002:a05:620a:4494:b0:92e:57ac:f6ab with SMTP id
 af79cd13be357-92e57acf7e4mr332685585a.59.1782744471323; 
 Mon, 29 Jun 2026 07:47:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4494:b0:92e:57ac:f6ab with SMTP id
 af79cd13be357-92e57acf7e4mr332550785a.59.1782744459354; 
 Mon, 29 Jun 2026 07:47:39 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4927038578bsm261501145e9.4.2026.06.29.07.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:47:38 -0700 (PDT)
Message-ID: <a18d83f6-c597-46f3-8555-ab1b516744cf@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] tests/qtest: adc128d818: add test suite
Content-Language: en-US
To: Emmanuel Blot <eblot@meta.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 Alexander Hansen <alexander.hansen@9elements.com>,
 William de Abreu Pinho <williampinho@meta.com>, qemu-arm@nongnu.org,
 Corey Minyard <cminyard@mvista.com>
References: <20260627-i2c-adc128d818-anacapa-v3-0-cfb94270a980@meta.com>
 <20260627-i2c-adc128d818-anacapa-v3-2-cfb94270a980@meta.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260627-i2c-adc128d818-anacapa-v3-2-cfb94270a980@meta.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bsTZtbl2SLYe9R_2QtoL3QL1HOzkxzLE
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a428598 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VabnemYjAAAA:8 a=zL1aa7899IKF6KB_RNwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX3eFMwMWHizea
 L364HrN7z3LYmemhlxy2cvakHp+tUR8huicHrVr65HdzFlukZqvn4OswASSp5y7vegCIAMxtAZh
 g3DdV6LD3zkHCv8WnaG5D4dDsw+kZ4I=
X-Proofpoint-ORIG-GUID: bsTZtbl2SLYe9R_2QtoL3QL1HOzkxzLE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX2LwRvL5CNlhE
 FD/dyJjqqLb/kqI62L9fZwI0wwYDk/K2o1RYEGGCOOqiG0VBWKQVsXX5ISadMk3EQbhd41wfRqf
 3VPGNRL+sd0vkxiVTUduD3gLBYgjq6KfVCXCxVDu0yyLAiQRBeh0bEv+esdNM6kXo33+Nmg0WZd
 o1VwS6rKNkap+KzauZYo5XYzEUqazzS/5kiLVtZ+EoaS6l/j2zxOQLzuFEkkoKd4mga4Yvefe+C
 IfWt20YEWPJ2I4i4lSCumAU+xOzvnQ1HzzZuYsZU5L5M58rRlVV41gbTiNavqOOA2q4YQZA9ERt
 6/dBgf3yfEwo9L2d2huMwT4BmzEkliKl8gFuM+/LXgRM1RhMuhmWiTaZDmbphgmNE13kq7GG+kc
 9rPju/lisRtCvcRdByvMjv4EsWUBY+Hqs8O1KR/fnaD+W972nl86BWxab58BCZRmIt23kGbSTeB
 t3QQZCPAqu9BFrv4nZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290122
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 28/6/26 02:45, Emmanuel Blot wrote:
> Add QOS-based QTest coverage for the ADC128D818:
> 
>   - manufacturer and revision ID registers
>   - power-on-reset defaults
>   - software reset
>   - voltage conversion and edge cases
>   - all channels with distinct values simultaneously
>   - temperature conversion and edge cases
>   - external voltage reference
>   - per-channel interrupt status
>   - INT_CLEAR bit suppresses interrupt assertion
>   - channel disable prevents conversion
>   - one-shot conversion in shutdown mode
>   - deep shutdown blocks conversion
>   - BUSY_STATUS NOT_READY flag lifecycle
>   - operating mode selection
>   - mode 2 pseudo-differential pairs
>   - mode 3 mixed single-ended and differential
>   - mode-change reset of readings and interrupt status
>   - QOM-triggered reconversion
> 
> Signed-off-by: Emmanuel Blot <eblot@meta.com>
> ---
>   tests/qtest/adc128d818-test.c | 857 ++++++++++++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build       |   1 +
>   2 files changed, 858 insertions(+)

> +static void adc128d818_register_nodes(void)
> +{
> +    QOSGraphEdgeOptions opts = {
> +        .extra_device_opts = "id=" ADC128D818_TEST_ID
> +                             ",address=0x1f"
> +    };
> +    add_qi2c_address(&opts, &(QI2CAddress) { ADC128D818_TEST_ADDR });
> +
> +    qos_node_create_driver("adc128d818", i2c_device_create);
> +    qos_node_consumes("adc128d818", "i2c-bus", &opts);
> +
> +    qos_add_test("id-registers", "adc128d818", test_id_registers, NULL);
> +    qos_add_test("defaults", "adc128d818", test_defaults, NULL);
> +    qos_add_test("soft-reset", "adc128d818", test_soft_reset, NULL);
> +    qos_add_test("voltage-conversion", "adc128d818", test_voltage_conversion,
> +                 NULL);
> +    qos_add_test("temperature-conversion", "adc128d818",
> +                 test_temperature_conversion, NULL);

Could you split this patch, adding group of tests (4, 5?) in order to
keep the overall reviewable? More than 800 LoC is way too big to review.

> +    qos_add_test("interrupt-status", "adc128d818", test_interrupt_status, NULL);
> +    qos_add_test("int-clear", "adc128d818", test_int_clear, NULL);
> +    qos_add_test("channel-disable", "adc128d818", test_channel_disable, NULL);
> +    qos_add_test("one-shot", "adc128d818", test_one_shot, NULL);
> +    qos_add_test("mode-selection", "adc128d818", test_mode_selection, NULL);
> +    qos_add_test("mode2-diff", "adc128d818", test_mode2_diff, NULL);
> +    qos_add_test("mode3-mixed", "adc128d818", test_mode3_mixed, NULL);
> +    qos_add_test("mode-change-reset", "adc128d818", test_mode_change_reset,
> +                 NULL);
> +    qos_add_test("diff-qom-trigger", "adc128d818", test_diff_qom_trigger,
> +                 NULL);
> +    qos_add_test("all-channels", "adc128d818", test_all_channels, NULL);
> +    qos_add_test("voltage-edges", "adc128d818", test_voltage_edges, NULL);
> +    qos_add_test("temperature-edges", "adc128d818", test_temperature_edges,
> +                 NULL);
> +    qos_add_test("ext-vref", "adc128d818", test_ext_vref, NULL);
> +    qos_add_test("deep-shutdown", "adc128d818", test_deep_shutdown, NULL);
> +    qos_add_test("busy-status", "adc128d818", test_busy_status, NULL);
> +    qos_add_test("low-limit", "adc128d818", test_low_limit, NULL);
> +    qos_add_test("chan-disable-clears", "adc128d818", test_chan_disable_clears,
> +                 NULL);
> +    qos_add_test("adv-config-clears", "adc128d818", test_adv_config_clears,
> +                 NULL);
> +    qos_add_test("temp-hysteresis", "adc128d818", test_temp_hysteresis, NULL);
> +    qos_add_test("conv-rate", "adc128d818", test_conv_rate, NULL);
> +    qos_add_test("ain-property", "adc128d818", test_ain_property, NULL);
> +}
> +libqos_init(adc128d818_register_nodes);


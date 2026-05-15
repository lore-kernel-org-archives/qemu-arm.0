Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F31CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 17:12:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNw4t-0002au-W7; Fri, 15 May 2026 13:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNw48-0002Fw-65
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:11:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNw42-0003Ku-Iz
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:11:08 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64FAML0Y4020777
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oFO5woUqy20XiAUuX19KXkAoiarIehV6NHqtEXjhBFg=; b=FIe9zRkeXJUrDW3R
 ZQf6LviVTKS5hsSQvswotbqKI48hhFdU9jGAeuSo2HzP92Xscrtms4LBKvu+5P6c
 GeVwbAONdKdZnHgIf8RkzbnxOIlNIze4UV8JmSLuZPVNf3s3jG7fsGL2aXs16/4P
 xJ/sR9FZvUMHT+OPhNfOjECuDtob4dCHj4Xu8H1BUdmQpWCKvlcGfCBwyawvRMQ3
 dUJrT8Tj5j4nGvgafRL/SQ5OxIOU779nz+S0z9DIQlypPGcom7m4QPGNmv4CTy1u
 QUjICFN10PL9GDZEkYgs9YU1TpGz9oIRf2Tb4bvkdz6eQ/SwPAYvxpa0t1JQ/WM9
 PAcRsA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1rv5kr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:11:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2ee5b73c5f2so405543eec.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 10:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778865064; x=1779469864; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oFO5woUqy20XiAUuX19KXkAoiarIehV6NHqtEXjhBFg=;
 b=HU+FSLfBfa9uAIBNpY6lMNU3al48SG2uHz3gpoAFrWUtpWYVl1f6DsW2WEdxPm3fyW
 RHyEz317KDu8OGklncxhuI9Y+/QzUNPZYHGrkwA9LbF/93azUkuabmqFDUq/8exR5FZL
 O6FI6H3rjKtyZTZLhH3h9a2SUdhUEWfe1V8FllDB0h84N6TIWIcYFgr860+bIE0uwsyA
 xozJNyBWgdrs5g314yWLH9XKneYxudKOMCeLU/ieWezTwNFjAozugVK/VpK9fU8sMTw2
 xypH6jLZwbcamm38cjCVhLECV8X1pLzgkMMjWrSd24xULXd/cQyYLjpclMH7LSZayHvH
 5e8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778865064; x=1779469864;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oFO5woUqy20XiAUuX19KXkAoiarIehV6NHqtEXjhBFg=;
 b=MU+bg+7VP6muD0dxI+7JTlKlctE9euvqGyhn5zo21s8vKRH2XR4yQBavfBiucJlVRx
 NbGDNIBiYYe2R90pfCe+mn41xH058LrM6LSQpQeXJL72s0pkEcFwPc7ppGSLtYuX6GpO
 El9V1ywu1RopjWSLhGuaih3qzH9J3aU5MWH3gEdA17DWjfoJfHov3b/JKQzfHFNbUpQZ
 1yumQV2IdD6e4jZAbE/u7OSdydpvQ1UiOdM8WR2dXIEJNWx8nR6VTDd5178HX9VOk5/y
 vJWYTuZtFUt3j90s/yuri+pY+WH4HRmes15ExbTPtP9UfRJ3VJQj8KsyRB02ow+pfU7p
 57xw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+x9PvxZvfR/zpP9LaldDFRAqjh7Ly3XhYhGqpXTK9vBI4/yGUWsNvN+nGJQdePzpiFwc8wruHUzQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz0keGuR3tmlwwo6q4ALDXCC3HPUYecrccy/3U7sY/SMzPydXSh
 8KR44UZL8wxjDCwf2HEq2R+73XOPrwoPm9FL/VB3dFrGWdxG6+HCPNoBCqgWejQJG6823dAqVJF
 sbhRsZo/8AdXlL4hcaMCCcHY7DuW8At2HxmiR1m7avb70DAkZbJWbekk=
X-Gm-Gg: Acq92OFhF8bq1M+mwdXoXI5ADHVCbzxhip0DE5Z8QafSc0z9pEUUELHgPsDcUAJ4k2n
 Xb41skA/+y3hXg0wCizfEaz9BYLtWwMhxmtjGMY+c0CyvhtpLyZjyE0+7GB89F93LmXxKnbXy52
 bm5CzgAKOIVFh8HpQQDTO/3E78HjNGIEshzat3H1A+SVP3auU8B1YFpGyTtATcfnihnTw4ey13s
 lA9pU95fAflcH/jkZRZGpC0yUyKCCt9D2Y7gf2mh8Dt0tZif8/P0BRrQiezxDI9HymG6/B4u5lY
 kx7aKtPM1y4VvpJSwqy+e/T9jCE05UHoeKEhcabvXDUjs8xkm7MZefILYEe9/f+jwLU38JqVAdm
 vwpHyomfURQ9V1dOXnSzj200mE2HoZZq/TUI2SryW1lx+3NOOkC2atLgLTjYSJeuoJeWr98PFlY
 ObMAap22lSsJ96Hg==
X-Received: by 2002:a05:7301:3f0a:b0:2b8:5159:eca5 with SMTP id
 5a478bee46e88-303982be43emr2435023eec.14.1778865063901; 
 Fri, 15 May 2026 10:11:03 -0700 (PDT)
X-Received: by 2002:a05:7301:3f0a:b0:2b8:5159:eca5 with SMTP id
 5a478bee46e88-303982be43emr2435000eec.14.1778865063354; 
 Fri, 15 May 2026 10:11:03 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-302973bc8ddsm7365542eec.21.2026.05.15.10.11.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 10:11:02 -0700 (PDT)
Message-ID: <55545b13-fda9-4098-ab18-9849a73ce404@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:11:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/20] target/arm: Implement DBGDEVID* registers in max
 AArch32 CPU
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-15-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515141032.3271-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: habsRjwv-XGN_1PDMEpvOMN0HhhLU-HG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3NSBTYWx0ZWRfX4izpXltlbdVu
 F7le2jpgYhLisSmpzfTHU2DzG6znVyQ9EgWKoH+lWHtljFIYIHhX6S05quGgURQFqjxwOStqLjv
 ET4ar53EdDEjEBD8SUFl4LOPiIG44tNztPY0IESu96/uVgU4ggXo8zwzaZE0Ksm/8cDaoW+oFrY
 1Bn4KQPaz96jZs4rvCEMFwberuFvD0BTkCp25rCT7Tj9qCAlxQY2ICbMFhMJWf4GtUsio80yvw/
 PDwJRslAGDR55jHz0RBBjVnQGFyIdOJ6yfX/ffTGjDvAouO8h0LeJ1byl6e18aNAJxkPRajhE5+
 7AbbUgbyQNtF2Jj5O4wMrq1dMuBvVrubyBGT5Pzgk7lXphok/+Cw6ofPV7eZ88FZ39huzGcYd9r
 aFxAOHKnqUCXiGBXbrb1vzMn/Xj3TqvVmKRznbnT8Bs72hiyr7zEP+sdXpvJowphDoIo5TDoMJH
 +iVJMCQHka/TX+LwrxA==
X-Proofpoint-ORIG-GUID: habsRjwv-XGN_1PDMEpvOMN0HhhLU-HG
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a0753a8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EI1JDHWyahz5gcua6e8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150175
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 5/15/2026 7:10 AM, Philippe Mathieu-Daudé wrote:
> 32-bit ARM max CPU is a 'Cortex-A57 advertising none of the AArch64
> features'. Keep it as close as possible as the A57, by implementing
> the debug ID registers, following the changes in aarch64_a57_initfn
> added by commits 48eb3ae64b3 ("target-arm: Adjust debug ID registers
> per-CPU") and 09754ca867f ("target/arm: Implement AArch32 DBGDEVID,
> DBGDEVID1, DBGDEVID2").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/arm/tcg/cpu32.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


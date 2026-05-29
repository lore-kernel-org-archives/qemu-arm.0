Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9C7CD6E4A
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 18:31:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT1zF-0001JK-D4; Fri, 29 May 2026 14:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT1zE-0001GF-H6
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:31:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT1zC-0007is-SR
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:31:12 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2Fet518291
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pkN1s9eqDTieCVIBdC0bdo/U49JIHfXY+v7fyyRHIZk=; b=OVqtrua8h2E2emkR
 WVYY4pDKLVsYfq1fsNMbLcUi78JtM4eFLGTai4jHButIucBHLj8WtZUoI4SM0/DK
 XgbS9buhvk/regybuRR/yPfJgjRdUMklLmebtuYfMFW4wR72RhfCuvBfR7fl5CMB
 SHjjJpuHwJ8yEu1dFGrQ8PmEhN1PqKMV/z98/7mfPqn7mF+zOZK+7lYjuCqiCmRm
 r9KKxPMRlSUI729RMILTYXD0Mgim0BX4OaBUzxEzoi63dbNNq7M7EtOlLANMaMO3
 AihqfWqD2TqEjt7DHjeVdIeNkXx/ZzW2QQOV1JHsLann2LOca8dxuCCzaDoDEWQ6
 v1xgJw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efechgtar-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:31:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-304df51ff3eso1947354eec.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 11:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079469; x=1780684269; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pkN1s9eqDTieCVIBdC0bdo/U49JIHfXY+v7fyyRHIZk=;
 b=eN5n55JPfGd/De54doNbj8TL+3LNZRzjFJMwgRze7wZfc+nE4rbP/TgiaRj4bbTOou
 Mvh2PLoQ+xoMjq63ZPav8s+uFwlDiHngHqJ/PsXzAyx6iKFau22iismv9yl1ceH3Z1CK
 K3Ws4O6k8Dw5Apw7Md14oikR3AAFsSDOwtV+YsZ4VY85GF+ldfegqKx8+m8WSKNnCXAB
 9++lWZYeATOI9vQkFkrkpwoLZPT8umgHiMwf98l47GR1yCpErEl/cNHxM4T6Aumob9TS
 LtEE/USesIUykLXvbbpJ+g5DgvCeQfcJNKlseJNwVtDGrXW7EtrAfbrN8ddJcCr//2So
 FPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079469; x=1780684269;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pkN1s9eqDTieCVIBdC0bdo/U49JIHfXY+v7fyyRHIZk=;
 b=o9/TLJsBmwKZ0uIUTQwY0aEgH4gAvBimH1B4bID+cOo5sNQ46TceKKcw4iqiuzJm22
 FLxRoHlbiIv+tpL3ZmRqTQfbez64fn9UNRGi/H7yXOHpb6HBJm9v/4uYqu1pbrlesUnL
 ly1OGEPYHkuvW6q5k4DN2JXbJRLuS4sBzzjgI3seBFqgNUm/afvqDweg+pHEJxVy5ih6
 uYW6wbrJXAsDkfGDBi/z+ro+sBSOmUU/EwFr/dfuDjCeGoylBBXVrZVfpgfSQRj4ROIz
 n5cjDo8CTrD2FtecxGIs39LsuXTDUoeonsyBsev6WCT/jicbHR8Nx2tFyXUHxd1vLOoJ
 IyQw==
X-Forwarded-Encrypted: i=1;
 AFNElJ//kZb3naDI1x56nV+zhQquGsvDWs+MfCwcDnDA4vUWdyyJQhDvo0/5jiHxELfxE0qBBeQt0gmj4w==@nongnu.org
X-Gm-Message-State: AOJu0YzteGn88LYOA5T7g25accynrcna49l4XOrtjD1Xz/FR/eRAEChL
 3z0KuiQEp1AYYokvK3wPbRAS0EFcj7E3o6wcxty7QUFRqP7knbuw4T0e//5TDn6Pikf/Ouan6oh
 2eVX8UhI6E4a5XJjLACXhzEWfjPL+6xjikK1jeXM5WYIHC3fkTJH7Ntc=
X-Gm-Gg: Acq92OGV70Kv4Vsu7vWk9LNIl8HJbIIUaTKcS+HkoE1rD/c8x+LA25p8zSzf57EdlfO
 XOGCErTzMw9pZ8ijGVaSekdXlM/R+vfdM0SRs6HyJ+RYTjhdyqNoSxoxO/UxcD/pSUd/Yhfiqw4
 QtU2dPTTQL3jQ+GdjZkQwZ4BryVLo1XyijRQ3aUKwR8EBqzyvwhujW+KEJDZmqYX+1sYxq7tOc5
 hplO2AQVWZt1nJBm1mbwnvtdKKJ2xjrHfguH686jnCOVEOu/5AB0dO1OFllnhpMilDLOYPjMqji
 5ROGLbiIB38go+z/nULPdwri6/NXSOQ2HihGAWIh/zLMd2IZQ6CUH6n9Ftt56lfJeKZUCA0gNBW
 PCu61V5IAOq9VG8ttGiYvOfstxionk49bInumV8TQRg6DF3VGGa1Bya0YN2kDdTnFa8oYQKhlEW
 CY/1ULmBqJCw++gj9mGe1X0SZx
X-Received: by 2002:a05:7022:ea2c:b0:137:64ad:a62e with SMTP id
 a92af1059eb24-137d4132657mr342506c88.30.1780079468948; 
 Fri, 29 May 2026 11:31:08 -0700 (PDT)
X-Received: by 2002:a05:7022:ea2c:b0:137:64ad:a62e with SMTP id
 a92af1059eb24-137d4132657mr342466c88.30.1780079468344; 
 Fri, 29 May 2026 11:31:08 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137b37cd5basm1681594c88.8.2026.05.29.11.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:31:07 -0700 (PDT)
Message-ID: <845a0105-1b1a-4986-b8ab-fc75639dfeac@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:31:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] accel: Rename AccelOpsClass::cpu_target_realize()
 -> cpu_realize()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JRAW9B2_F3lihYryXRIDupfZVg3YD-kq
X-Proofpoint-GUID: JRAW9B2_F3lihYryXRIDupfZVg3YD-kq
X-Authority-Analysis: v=2.4 cv=U6Siy+ru c=1 sm=1 tr=0 ts=6a19db6d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=x-YBvYG0Dqxg5h5i4QgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NCBTYWx0ZWRfXzJSDGVPHGbj3
 GjEkrDV0glw7Ug9ORx0KHjAfKZ18bCGyMASHQE/12vODm49aaCqkvCL7dy34nfgPuXC6vFtTMGU
 qqWfUqaO/PevHS9TEb+cKPBTdZanNHm01pHUGFamyQsxa88sCQI3O+vloUX2+MRpGfWvEHF6B0h
 G0p2f4duueBFgvTK6CgsH1jdLVG/2CIzKTRteD+j54VW/uhDS6Yxgr4t5Nhv2xP1NGgdwut8KcA
 VQqLHBXre9jLDrv7xJPQr82ec5+YLqCfLqxxhKAoY2fAFN3niE7Nf/AiZJsLEg6W0o136SemmMf
 O5i5U37byg0foWMLGUoWR9GbeTP8HK/e4PQ1duZL9fMC02gGgbrf5BaeVkm6P2SGsKAZK7pDRMm
 9Lw7NneGFNGBBzdkNQohM/X69vNBjdgm1yR9MEWy7ggeK+CBjMYJZD5a4N/tXc1+mIChj7Sylvp
 UTgBLqDrkfA+b0bfj9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290184
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> cpu_target_realize() is misleading, we simply want the host
> accelerator to realize its things on a vCPU. Rename more
> generically.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/accel/accel-cpu-ops.h | 2 +-
>  accel/accel-common.c          | 5 +++--
>  accel/hvf/hvf-accel-ops.c     | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


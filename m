Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22240C9832A
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 05:26:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBQMP-0004av-Aq; Tue, 29 Sep 2026 01:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBQMC-0004Y6-8K
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 01:26:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBQM9-0001bj-Qt
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 01:26:23 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68T4750W419695
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jpd8CBJugfETkbR85ahF7Wd1aLx5DAhy1NA0fIAAcBk=; b=g7H8i+HE1/gIMjnt
 9n8xuvpbpUwtSh27XrPTvN659ZsSrb9LKN2vOOTJR3CkxizUcrnDs/iMRyMmK6SQ
 qp4ND+CGmscV7T/tDd41lXoTAT7WLXM/u30aNraCgmAIyM3WME9evsDtaZqpec+O
 2DxaEPKs81xebpxZNsFRSPJfZvmtWP6AdcGKLxdOEVXbF0mQd5P2ZcOX0syWV98z
 niY4QdXommEl1Gzp9+qVxE7P48heH2Ol4Ux2FZERjsMqmz4ZcwKHAjZKeClRoJ/j
 u/8A71cTF4C9fUflVulcjUbwxqRvMWNqaNPzdM+ZMA1G/CjAU9QDsudn/VN6xDK3
 UinDYg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyxmu9s85-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:26:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93c6a0d2122so454386785a.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 22:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790659579; x=1791264379; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jpd8CBJugfETkbR85ahF7Wd1aLx5DAhy1NA0fIAAcBk=;
 b=ken2vv3akGRYY1DGbzLwwhHC0GUlObpNyGim1rCbNL8Dz3G2l/JpCk62yHLcjoZOX7
 /EhAUqrniED5ShkmiCfEVyPVdAOlw51d8cmakc/bojUDW66TbeABfrgMAeZrl4UU+uCH
 1VlMZ2t0f6zlKDjHgQIsNmbsFRuGVfXoGz7wipzyR0T428v4MDLMFcgCy2k79deKxEgf
 7kZFdoAMzalzJKQM0R+cGuF3E7wCNdpF3YwSbRkbjCOCJuE4pQHDwv5EBplKwmqbcs6M
 oxG0WI1dHJIUN+TopVPORUAXjHOMFr3nuf7A9xACYb9Wgq7YTuflzXBjdR0QGbH7hzlh
 vg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790659579; x=1791264379;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jpd8CBJugfETkbR85ahF7Wd1aLx5DAhy1NA0fIAAcBk=;
 b=rmHSwlwUxSQtA6uQwrK4Vd1XG68JfuoGPR3TXzUEu8ixrF7DwPFH99HfdJmqjvXoK/
 2EkXuKqp8xP7G6Y4/wqMZloTnlVRps7ro0mL+ozuI95qqRbUMLbh6vdXnkbDBIX+oI49
 RG10zRSAfpiBsdSMdUBhylXcXvhX+DelYHGNI6yzGZIT0InyoB0L5G90acCVf81znpbm
 Z/juBahGwczN9ADGZMhFSLcsJZP/pJ4ziBG8bekStK/dNH+xLHcEIGxtVYgx69rofbRl
 emACY++ggVU/fQbR6yoB8PADSt18631zDEoz547TBEnHtnsUUcfTVPe6OURQnLvIcPgG
 iBhA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx3VFFUkOKPfdh8d71vrchAHjs9WBI6EbMPkpwNOaXDTnlP1yB2RxA+7Cq2iQMixswU/vZ+0mhPqg==@nongnu.org
X-Gm-Message-State: AFuF++nCCtcoq1usfWiYLeZLz+Pv8mxPzdJwpvbasP3EJbgTKKO8b7Uv
 CwBg+6G3O69maMsr69iphBQ/7PY4SO0uSmdLZ5dB5Oi/hSy7NNUrXGtrxdpnQjMOxMDyY7mAyrz
 SuX0TUT/6iyGBr+HykZ1bqaOmE86yUR3WFmubz3/bI2WcYLZW/jmmWPU=
X-Gm-Gg: AYBFou0ewE8VSqZzZhG7F+kjzGZfOjed2E2sNV2ZTPvZEcQzt8f+z2BTcxsyqIbXypS
 emUVai/IsqzuDEpd3r9pRe+OUg+7of5XCbkS7hrXfWznJRFLK2RfVDtDqzv40YCEB3j4PL4Ysma
 W8V9B8hgVPeNzDZFyDOIAW9MLlQAr0ScE3w8DPGyaQQL0eN5lgzBriRJ54eS+mYskliwTy2NstF
 OYquwM1VHa/qpDt493JgLFUW1WxPcOkq3nN4Px0Ot1Tgr/g5Xm6/9mKsdF3kyC9bA6Z5hslddBQ
 MU7cm3lHeKrqEfaYKa3BS6XCXHiXNttrZL3n9ZD1398y3DFfYGHl+vBkHPA6ASnM20Jb0Wd7t+M
 SD33vpg2yCsstBm5olWiekVopY+3EDSnC7Q==
X-Received: by 2002:a05:620a:4623:b0:93c:29b3:3525 with SMTP id
 af79cd13be357-93c43ca0058mr2531053885a.36.1790659578879; 
 Mon, 28 Sep 2026 22:26:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:93c:29b3:3525 with SMTP id
 af79cd13be357-93c43ca0058mr2531048985a.36.1790659578421; 
 Mon, 28 Sep 2026 22:26:18 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00cfe16a2sm47919265e9.4.2026.09.28.22.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 22:26:17 -0700 (PDT)
Message-ID: <0c156b42-3476-4ac3-bd29-f4e878108f0c@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 07:26:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/24] target/rx: name guest trap numbers RX_EXCP_*
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>,
 Glenn Miles <milesg@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
References: <20260928052051.251-1-luoyonggang@gmail.com>
 <20260928052051.251-5-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260928052051.251-5-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMSBTYWx0ZWRfX8BoNNOOJYfAi
 by7RHerPkWxZXTjcdCBHqvdljiwkhjYtrYzqCqI7Qky4AAyTjxvsbqvqtEVA217ALZkjESQwS1Y
 G9k1ctGOaUuKB/xiRDjwO2jpdgQd16w4OmqPGTJTJZFuTdevEKCZc0KxJzjqFD2EINAwu3Xbswo
 BPiCWZMQwJGGCEZcxDOID225idwsFu/MfUGC9beU1VZqP+jUORkEfR7YhfpY6wNJxVm3SwfRI5s
 qPFdSttS6HTJ4+bIYs995jWkHzG521vLDwJRemSIGkqywQmolOVetTzDaLJzFDSIyCK8Nv1xsyS
 qXYLdyshpcvDw5xT3Ryoo+S3rLSd3iLQs+lYUIb2x56fb1AzVJFcZ66NvpuvlNNwF/ykY3vWKpS
 lQC/CwY35Nekyl7EMBk5TU4T6uGu7fL8HJHLMtfZOt6I399XdgKGiRdT0z9xXfVgk/mP0muo0xh
 tY3hez4A6tHHvkpJxWw==
X-Proofpoint-GUID: WY4mF_IKIbyJ_-V-YtVRNz--Chb-j41C
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMSBTYWx0ZWRfXyXkRsYPhxm+K
 cJSpKjw0xYP9cEE1lUS7b6dGp4bpOzxUieMqkcnHkCAEgRwSTya+ZlpZNo/UyRWXmIWJFE5Va/A
 dI3NGKiJpohJWeqpRpdcpPLfFKBmLyU=
X-Proofpoint-ORIG-GUID: WY4mF_IKIbyJ_-V-YtVRNz--Chb-j41C
X-Authority-Analysis: v=2.4 cv=c70+0h9l c=1 sm=1 tr=0 ts=6abb4bfb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=T3N3I3ExGkZWRGUW1XMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290021
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

On 28/9/26 07:20, Yonggang Luo wrote:
> Add RX_EXCP_* in cpu.h for the guest trap numbers stored in
> cs->exception_index.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   target/rx/cpu.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/rx/cpu.h b/target/rx/cpu.h
> index 64ba48a7329..521e494172e 100644
> --- a/target/rx/cpu.h
> +++ b/target/rx/cpu.h
> @@ -71,6 +71,16 @@ enum {
>       NUM_REGS = 16,
>   };
>   
> +/* Guest trap numbers. */
> +enum {
> +    RX_EXCP_PRIVILEGE_VIOLATION = 20,
> +    RX_EXCP_ACCESS = 21,
> +    RX_EXCP_ILLEGAL_INSTRUCTION = 23,
> +    RX_EXCP_FPU = 25,
> +    RX_EXCP_NMI = 30,
> +    RX_EXCP_INT = 0x100,
> +};

Thanks for splitting in a previous patch, but we want to
add the definitions and replace the magic values at the
same time (i.e. the changes in rx_cpu_do_interrupt() in
the next patch go here), but also s/21/RX_EXCP_ACCESS/ in
update_fpsw, etc...).


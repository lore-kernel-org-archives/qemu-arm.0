Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF91CCA5FA1
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:28:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBWw2-0007Qk-5r; Tue, 29 Sep 2026 08:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWvs-0007Os-IL
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:27:40 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWvq-0004LL-TK
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:27:40 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCDw7K1491563
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J+1tWNwKEUBh+hsPODxLkob7SYTYWkKv+8Iw8LfCRmc=; b=eGpv3xdlanN0hXIg
 abNolpKE4ppil3MSDkcUM+iRce/IS5FP/xa4ha4+/w+qvoMmbzM/jyj9w2QhrrHM
 ioKu/iu/bwfA1ePH3wj7EclPSpY1yqfDO49bKeuB8cy/WB/k8/r2J9lZnDCbF4on
 wS4GOi0SIaICxG/E4e7RcqOzlkCmpWIaifLJ9KIxQOwMGmPSjb11z1XF4viDjjRD
 trvz9WFr3vw/sDvG37dY2GACnOHL8oVPrqjGjNH3exnnxKkequss5pKHyaccGqkb
 7D4Sj+WqMOfrkZKPXwjW/gnN/j/W+k+Q58RJzg9O/ceM5oRm4igi2PxC8nLMBH0w
 mv1TRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4rxau-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:27:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93c673116e3so559583785a.1
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790684856; x=1791289656; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=J+1tWNwKEUBh+hsPODxLkob7SYTYWkKv+8Iw8LfCRmc=;
 b=R4LEPBtE2zq46crjEbQL2MjzD3GxwlqNcb/Jp44UPzKVqmw69H6SA2vzLp4OGJoJ+m
 0aycN8itaWily3YaKeR1PegzXxDT81nf4bXm043f81oHXg2bGo4GSCLd1UIEgqt1SoBk
 5G1LiEZHkak80rEbXR7M7gzfUKzaB44yKejy/rmCL0fZmTP0PfH+Hm8dCUUGx6Ggrkvv
 0Fm3zhIgTFHCeADZIRp630ncKOtAkNIow9U19W2JZu7CmgWKAtKbMnSF/1+nQ4CaW6UE
 Btc6C8JZ1FmFjduwlOWMvbb3lALIdOdlFQcEp7HZEV8EZVbuC+ZxbPUrepYlMhQH65gT
 fDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790684856; x=1791289656;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J+1tWNwKEUBh+hsPODxLkob7SYTYWkKv+8Iw8LfCRmc=;
 b=F5RadyIC8I9J92NeHdlTLeyTRB7jc2gYF8R/ipDG9JQE4UlhnehMRDjxtsAV/c0+g8
 QVy3oYeowUlfVhLzxr3ZSqzjaccicLMv4LaT3ZI1WfHQsEGSNob8oxrF3SeIgZDrwsXb
 85y5fPbDTe0HKOfGCZZwKI5qXwmhAdx1CdQGXdn3OA3+efseicZ8aBodhKVolLKg0quJ
 KrcuYb+cxeSchZrbZ2wY5HOHyinSVx/ePjOSOPszCy2PnTvAklNswDOuY/Red9NCVXDi
 vHC+jIxYeafNp/1F4/6PRNu69vN2kRo0c6i0aYTgzG7zs/NS7dCzZSh8OCLY1L23ZkWl
 O62w==
X-Forwarded-Encrypted: i=1;
 AKwUvByctHcyL9ruhnBpJsAlFBJzFbopN9+jI7QHoM4rtc1LVwWjQcGwN3uFWoXJdVr82MyaeckzKjuh1g==@nongnu.org
X-Gm-Message-State: AFuF++llpT39HK7MpmeLqIKvOx0cesg/KBQEcFGz6xQZRyDy+r8O4+JP
 xBhg+q2IT/toiiAfUs6RxIRLwbHt0VvJF99iDa8XX3fjRp8S/Ldo4INQcx9FCMu4ADp+deUnTWI
 O6ieKVEDyb6OmA/c8PptSePDQbdWMHkzTooaRsyEfRLTVI041l7uZoxk=
X-Gm-Gg: AYBFou1RyNxbUXhN0V3bZp7b+WjbQwb0CqmHSwirWSvTPEx/XZovhnprThwx3iYtXvO
 4yogMcIkDVg0sZTskSzrjq1NIjcXNC0ezNq60OcLPwlYNFlZ7nTCv/7LbdPn78qfgS1XdN3NzQf
 aNxar1y711fKWGJBbWF0IzWxMvjQK8zgQ0AX0h4wTLVf9VrU+Q5ns+fm3fIOGFrTMxDL1Fywu7K
 jCOWqzd89IiBb8SXNsHqvGPqYQRQLzjWR1HElv1kf+Qv8KaThEYqrrJdsxj2aJdRUyzL99P8gMl
 yb5Bj+glqO4Bmy8onOZlKNzfipr4qUIU+YvWJDa+di8jNJ8qABqU/upLJzoAiBH1rMhz78IenGx
 D+r1qC/PofwcDAHipPT8rfho9fPL+jOGA9Q==
X-Received: by 2002:a05:620a:26a5:b0:939:ff85:8067 with SMTP id
 af79cd13be357-93c43d7bbf9mr2748581385a.30.1790684856035; 
 Tue, 29 Sep 2026 05:27:36 -0700 (PDT)
X-Received: by 2002:a05:620a:26a5:b0:939:ff85:8067 with SMTP id
 af79cd13be357-93c43d7bbf9mr2748575585a.30.1790684855524; 
 Tue, 29 Sep 2026 05:27:35 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00cf9b72fsm102641445e9.9.2026.09.29.05.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:27:34 -0700 (PDT)
Message-ID: <1f1dc65f-df09-455c-996e-017859db39c2@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:27:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 40/42] hw/net/imx_fec: Trace with QOM path where easily
 possible
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
References: <20260921214710.29422-1-shentey@gmail.com>
 <20260921214710.29422-41-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921214710.29422-41-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX4A3cVYeB7wgY
 DHuyZcW9S4huMHgNBn+EZ7/QalMcA04YslchAFQNygI372HFCkdnQERWkTTGu6RLlbIytgLTrRR
 6IfcwhxQPWD0DZ+f/2L08DnjnnWufig=
X-Proofpoint-GUID: 6r6x6YRUpytCOmF134Ch54I8l5mekE3G
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbaeb9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=8pFOxt1SePsmpDuzWZwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 6r6x6YRUpytCOmF134Ch54I8l5mekE3G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX+V9UgWdJqfDv
 Uov7/CJZudhbVdKlT7KdJIcBL5kG6PSXXE8jL6nA45Sf0CgB3V9nZzrJFPmH2z6SxcMWmAGKO2p
 OyYWaMexhgBoMy1//l7Bx0BWkXfl2mCQgNEXiz20WQ94BgPsV2WdGSCiEnr51wYGbptKozdd93t
 a1FnWyYjZQblU0e1UevK2dHuKcOSrqYSZ5/YdZ1paT2E124EqQ5/rN11OEusDXFV7Rn32tjpucX
 NIUSRAluz9NBRbgUwHW4Z46r/dnRm9yBJN5S8iW9vRj2WqN4XOE7UyyZ6c3VEP9nNSkDQacYo4V
 qohNo5m2GRnEqO5iaTZm7If5ylE2TJJxr0BtmMP+rG5Www/MKHE+M6OqkqCDV/GEDtGF7Ebs0ly
 bC61Vd5/Zd5aosBXtDgWVZhQhFJIU8NaMxnLVuW02M0Vz7WyDw2bBbTUjs9pcup0C5vvtvfekSS
 awpJMT5i/FY0zUZfpPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290049
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/9/26 23:47, Bernhard Beschow wrote:
> Some i.MX SoCs have multiple i.MX network IP blocks. Allow to
> distinguish them via their QOM path when tracing.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/net/imx_fec.c    | 28 +++++++++++++++-------------
>   hw/net/trace-events | 24 ++++++++++++------------
>   2 files changed, 27 insertions(+), 25 deletions(-)

40-42:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA20CA9EC1
	for <qemu-arm@archiver.kernel.org>; Fri,  9 Oct 2026 22:22:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xFIyI-00024s-Al; Fri, 09 Oct 2026 18:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xFIy9-00024A-Bt
 for qemu-arm@nongnu.org; Fri, 09 Oct 2026 18:21:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xFIy7-00008G-To
 for qemu-arm@nongnu.org; Fri, 09 Oct 2026 18:21:37 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 699KhiUa2706495
 for <qemu-arm@nongnu.org>; Fri, 9 Oct 2026 22:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hVlvM9e0AWE2aW4sB6UFDll9vFt+UNUNJrYPS6fdkjY=; b=bsrHhIIsgfnCzYNJ
 mvMCkRDTkbBj3QqF9UXIYl+DjUtpZn4dEalifsU5XqrvPhy1OidjDXC53mROWcEC
 oDmP7E2aL/rPw0k1u+KCc1QUyw1MbCaapEfEMSXuj4XpyaPnCpUsX3+pAXLZk0ng
 js0nX4N2OciAS4Xwn6H9V+AQLdD16FM7VOm+6yD5ahm3Fk03h9zlhYdl6cUhBikt
 Sfi53UX2E6YrfY29nIhRi+lZRF+jKPu1DGL3wnM3zl4SQEWES6W9ainIn1bMlh4q
 j0auvzbehjpwRsjIVZ5gCLRbVelg0oDYhyrUmZJYESTW+SUY5jTKa1f4lxcDFzZy
 7M0wJA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8rvbg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2026 22:21:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-3510d0baf63so523505eec.1
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2026 15:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791584492; x=1792189292; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hVlvM9e0AWE2aW4sB6UFDll9vFt+UNUNJrYPS6fdkjY=;
 b=JPB2To0aVKv7+3SUtJxLb0zE2K0/xz4G/CSIMne96YfZQeWwS0rUVqu1WnlIF7gC8H
 ZeUAOy6IqHtuMjfHNBRBzwwPFNbpVxHW5Caps8LoLtIQaRt/hdZORtaEQGD6NQ6VvR51
 WwUAb9FZ6H5PBajAiq10rw2UwEbZWd3F40GWpkgMN5eL9ojYoG56adgLCTFyht5sjqat
 znuSjGr1nlKj1M1TErC3HSo3/KtKKiQvDBkDfGbABmn276w6626eab3Dkt5VMpTrL2Jd
 JZgo+Bz66+Su8sxYOPyhzmBwug3Gr6jCrSMdgui65QHZp3eUUgYrw2+AtyrZIzsSF0wj
 W4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791584492; x=1792189292;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hVlvM9e0AWE2aW4sB6UFDll9vFt+UNUNJrYPS6fdkjY=;
 b=KGLVADAgP1PvOMmtoSLtNmXtpxBKOxBMFKi+TnxbTJSxPlstmqClEYokrQGKVVVK63
 yZQAP+hm5cWcvpq4SHA8nZf5p4CzY379J+tfaAVZ9qHphmNNST/vgH1AyXuTyu1sC0r5
 VYPwaFmgmyBriRcJ3k7kSRUKQqHhq/FzuOeoT88Sdjy3KmRaPEWARoAybknFdm2Qvb8C
 W9vkAApTpIXj03yq4Ne/KEf/Xw141XdYGIhmNnYgI/mibaKmr2GzNk9ymOCbs8Gu3jro
 xZWQwj1yzChAi8OGy/vdFF5BDyYvit9I3jLxS9h4UU52jAinRkShHiDtmIAFQEdkk4R0
 9nRQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwlISnU6OK9+d+sBOm8D04GWXKLBgRW8n3o54mw8aDWUdv8Mqy696kB2jZkQXdAh1OjaRz7gAekHg==@nongnu.org
X-Gm-Message-State: AFq9FYKF9mXsexD1+v1ywSFu/ufBPGS+ivCf7d5g35cuCt25QDsVlThr
 KIZ9cY28jpZDgtDtqg0u4jAPp5GA9s4ulZBPIWVmw//zh5sGnRsfU7vi3YvJSKmx8JM3xBuqJUk
 B5OOtLj6IG4743n+fVZUcndQ8dELSdJ1TkIsGgzQ4t+4D8JtLjUfvC7g=
X-Gm-Gg: AYBFou061YcTVWrAQ8uGEOGVDUQwQ/gqIxroCE9hy7hpl2Re4pWxuNVErhQJAlXFYbL
 J9VDuJabMQcwE2qe5XcZm2h07Eh9N6w0kg6a3UnuP5+iiPnDXdwvprbP6+CX0YjhABx7Y6xz6fq
 thvZla1x3zYBiLSnfknpxdky64seJ0cMR1YI++EJKy69tqsP0P1yANPonDt3/lP0mewFbExUVSg
 nMCOuOF7hDHbCLZfdo9Y9sUyn7/elIg3g4YUj3CGN6AoPJ+trlWghsBJT5OvflkJVrTSKtt75yn
 QWpJXwJux0wupmjP1BoIBW524aMNVTkaOtyAwHiZSBczCAM563c/b6yfkz9/AyJHLK22P3DNYbh
 1j+ofG5BJVoSvQkqxdzF1pIQXqnXNGDG2vCIRU9lO0rlfmGY1x+mTvnJHjZG1qoFO4UVamw==
X-Received: by 2002:a05:701b:2810:b0:14c:d8d9:9502 with SMTP id
 a92af1059eb24-16a5e49fe06mr4608066c88.14.1791584491876; 
 Fri, 09 Oct 2026 15:21:31 -0700 (PDT)
X-Received: by 2002:a05:701b:2810:b0:14c:d8d9:9502 with SMTP id
 a92af1059eb24-16a5e49fe06mr4608023c88.14.1791584491347; 
 Fri, 09 Oct 2026 15:21:31 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-16996eac537sm8185995c88.1.2026.10.09.15.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 15:21:30 -0700 (PDT)
Message-ID: <91a6868b-9f11-4343-a95a-a9832f3dfa74@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:21:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] qom: pass TargetInfo to the is_available callback
To: luoyonggang@gmail.com
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Stafford Horne <shorne@gmail.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <3631c54a-5ad7-4037-a21b-37c3c61d712d@oss.qualcomm.com>
 <9ee6fad5-4117-42f2-95da-818d5b4e0aa9@oss.qualcomm.com>
 <CAE2XoE91jjqtF_gW27tQUMiWoJi-pfYQwxWGe75+DFpYmY2iHg@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAE2XoE91jjqtF_gW27tQUMiWoJi-pfYQwxWGe75+DFpYmY2iHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dZcVTnXe c=1 sm=1 tr=0 ts=6ac968ed cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=CdOkieOC1uDM26-5aAgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=QYH75iMubAgA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: y7Hkq-H-lj0rTMuldkBKZIztMHnklSzx
X-Proofpoint-ORIG-GUID: y7Hkq-H-lj0rTMuldkBKZIztMHnklSzx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA4OSBTYWx0ZWRfX4hdlvU4DIDRb
 dtA7BA2NprR1fR0+hmI0sWwNzbkESFihBhuA6YKKbPiuz2xsqfls1bEx0TowpwYii5uBmz8cSTq
 qvtgdP7vHL2RZso10o9c2I4PMnzKkUw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA4OSBTYWx0ZWRfX6FnP9t/HKecP
 221laW+1TQ3Y0BSN5jwHkuuU5DMHDbcvBw0BIPqCO4cTL3ELPG+XUkesL/SdnOlujgZWgd4XHfT
 9Zy2+ECPWdTCdREaa8LefjnpGdipQX/mP9s5XFaC2AhGxRf/vCKM5M998OjGHNmFLraV+e+u63H
 ycQHRKAOxO3MdkJI2viAUkRIHWmXGD0qmHW+zur5Nw8MNK/BVc5Tnvc/y+rI7fAMgYdqUlBH+c6
 BJT96z+MtAUUiaK8xpMhhGwW9hjZ/0u2FMfMCgGoccTDGvU3Ts/9lVq/2bcT1mOpR83CwCx3Tjd
 +wN/5MBBoUv8Ddu/zO/O2lfM0japVlTUogb+ysQYw1ONWFWz+SwPkri4DGkgJ23AUBa+kF/CjNu
 88m5/qpT7Uhbnd9XeUA8bpHYXf+SFFQFIVP3PyzIvgaxkaKdM1TdoCxnfH+ia4xlReiEqN1LkEy
 0wbZIYfprGQyn6owhgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090089
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 10/9/2026 3:08 PM, Yonggang Luo wrote:
> On Sat, Oct 10, 2026 at 5:58 AM Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 10/7/2026 1:46 PM, Pierrick Bouvier wrote:
>>>
>>> I'll pull the first three patches.
>>>
>>
>> Now merged upstream (40ba85501c0b6ac2a7319d3804dab072edf67564)
>>
> 
> Hi Pierrick
> Seems you post to the wrong place.
>

Hi Yonggang,
oops sorry indeed.
I was waiting for previous patches to be merged to send those ones.


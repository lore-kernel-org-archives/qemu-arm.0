Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E78CA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 09:02:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENNr-0002uE-Tr; Wed, 07 Oct 2026 04:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEKZ9-0000KT-M3
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 01:52:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEKYv-0000UW-6y
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 01:51:38 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6974U1bj2878558
 for <qemu-arm@nongnu.org>; Wed, 7 Oct 2026 05:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jDqU1asXJVNklrJMBXsgkl0awJ724rKzgxqsm1RENOo=; b=bflIWJ6yJghTXTDP
 Ddaz3kCYbfcAaaE6sjzBi7izrIwz0+7ThU5MGFsDu3V28kL9REJdtiGSXd2U76D/
 1Xl4BokxmKXWL0oN556mkqRJXdWt6GhuRv+Zoduxm1BlmpB1v1Yds9nM210Dwvsi
 YDMcYWEvmO341CoSUdpQcFaOq6+E4Ij46vTxs6pFBSmQWYYjqarNM/03GX2oAJbV
 fr+qVN4tmPOH7zuqFpWw/R149MK6st/PgvSonRgxhFf1oKKxqJDyADokmn7fqH/a
 7Qucu/OM/SrHpD0I1q0zgGZQ7c3uXI0JQkDSJ6p78R8GvJ8VAQetLDNDN+/POrsD
 HBLmCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc9v9ut-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 05:51:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93bf4c0af4eso563255785a.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 22:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791352290; x=1791957090; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jDqU1asXJVNklrJMBXsgkl0awJ724rKzgxqsm1RENOo=;
 b=O1yzfR8pI5iowo0eBNxFNpm5Az6APM7vkzceKFV/Iar3mrL5CbpeKrfLRrGW1u3oBk
 tgmtGKM+oyb6LN9UB7SgQu+Wt9tstZ4UFSShpKtmWn+n1RBkT3Qc5ceVQLQ2cqH84U0L
 O7QaPRLZ6ECKLR3UT41MJaj2SK23FUBvBZUAbOjCnhY9MSZadZUx7CWd39iiURf8AfwR
 wTSU/jJHOtQdi2bfPQinN4OcwjDWoyY8xAaURmXTKvASDJ/ZFEzhQA+1xK0y97bLpFS2
 4luOWhbahR/5O61+1BSRMqnasGbtJ5/LQx1RcqsLoL3a1ISF+kiyOj8ACadvBJ4DGdwx
 thfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791352290; x=1791957090;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jDqU1asXJVNklrJMBXsgkl0awJ724rKzgxqsm1RENOo=;
 b=CPBBXwXY83TVC5Ko9PAH8KZEm4MLGDXIoffA4ZtGmGPpmrNLo8LOBy07I24MnkTQxb
 +43E5I1OGVmjVVfNuzIDUPWfSdA9gEBH44eC/O8LE7zixC0ECiR///Jh7Hm4GzbJJ/Y8
 aLNhdmgjqK7i4xfsMJOyg0ePZnRG5wRqfBiDmTG1JUQ3ganyRkb8IqcC9v3xtBpiaThw
 96JElyocdqY+SjP3qk5PMoZPeXA8QBs7ubRlTcFD32Yr/Fzgg4ahf8hwDTvw0ycKSlI8
 zbBGhTbpWD4/Kmco2zdHD8eJqhTWI4B7Pt2VE5UrJJ5/NR8PXK7PImCSOtyGrqdyKZe9
 1B0w==
X-Forwarded-Encrypted: i=1;
 AKwUvBw5ClgSiW3rFP4BUtGYQ/71iDENtaj9Fs87Yc3nw/wrs7GS37Nu9iAG0PMJltqSpkk3juaQlzrA2w==@nongnu.org
X-Gm-Message-State: AFuF++lOj4x8Yltm0ZvXv5D/8G0nVFPP5xLrPKFEFAH1JEf8807r1KD1
 +H+Cz6oYzHyt3y+77UDNBxxujcD4Cg0bGn+i03TJk5Vrxafy51A5HMe80cJwP/CdApIGBppDMI3
 b0kpsLtwVbabFGRU5m85X2MrYwzbhv1AgoqOWR5utPhXdulkwXZ2Y0FQ=
X-Gm-Gg: AYBFou3VO0LSsEcLt/XHSKRyTB0yOtc50i+sYUatKeb0mvNf3yIhpnilfEKMqTQPFTn
 bdtprSkQk1IgOamudTTLgWLtOXqmzejc70+TLPinS34lUmPQgVp8+ValwAk5QThmE+JJEe5OYWi
 V4w7yTTLt/y/8Pp2V2mez6NEhixqwOmKa+3XonwtNwvvJnncJ5wDx+yy8KWIBG0GZtCR7VkV7cy
 LqS/N4tdE5/nJsmDKdGQYyBVk+HxnC6+9bzVaSAfj0DkagggPixIpShVCM38puP/zakzTTanZMk
 sFWc77RVKiRAm5MCFhMTnORDi1vxb8rdra6F4a+Eff1BQxiXNPUAmXIEJqqZsiM+5cd1XyX1E2A
 I7cE1nCICrQlmrFeGScywOSs4P8MVWtOKeA==
X-Received: by 2002:a05:620a:394e:b0:93c:290e:9e9c with SMTP id
 af79cd13be357-93e860404a9mr924133685a.16.1791352289926; 
 Tue, 06 Oct 2026 22:51:29 -0700 (PDT)
X-Received: by 2002:a05:620a:394e:b0:93c:290e:9e9c with SMTP id
 af79cd13be357-93e860404a9mr924128285a.16.1791352289477; 
 Tue, 06 Oct 2026 22:51:29 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18044c970sm18616775e9.4.2026.10.06.22.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 22:51:28 -0700 (PDT)
Message-ID: <d9f09744-4d92-47dd-a1da-6d20090662cc@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 07:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/27] target/sh4: Define exception vector constants
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Eric Farman
 <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, qemu-s390x@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Helge Deller <deller@gmx.de>, Chinmay Rath <rathc@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20261002175037.1747-1-luoyonggang@gmail.com>
 <20261002175037.1747-7-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261002175037.1747-7-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ctMOAF4i c=1 sm=1 tr=0 ts=6ac5dde2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=5KkIcTHh3hzyv8iDLVEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyMyBTYWx0ZWRfX4L4A7KlLl21x
 sMtbh2O4F78M5ED1lM7nLgcMWi+iCiM8th/SJyvEaPoLINVAhxcuAgoD5jLoHpeoYClpG8y6fpm
 iVe07rdiDn9HN/mhdGhYWmXEcNa3yTI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyMyBTYWx0ZWRfX311QK0Xw4WV5
 1md1tlbz9EqCZk3dDHrJPurq+PptYXocyhxDTOG507ERZgQgAen65iz6gxLLE1iCdZ6F10JSIuw
 2qUyIYBirLlwvjjiJIz1n48+uB8C6bkX3oJHx9WgZQV+pw4ORa7VqyWqMggY8GF7I41p6XwYdlk
 1ZXeAgOcK00j9Kx+INrsHULivS/ldb3BUT1AX6aQjzD1liogYUd9hGQRn1rer0SUnlmlaFPuPUI
 qSMd1BP2/IjMV246bYon55H7q84pUlQhAv8dW2suBENPa2uNn7cq9VbdmbZyOUzLZ7imq0LnMbA
 2SB7l8s60dZQAphbcmduM2qdqfNXhZ4AWCDrRUxhG2FpaAgdaFhY2e90BJlCUPzykfxFszR1BhS
 bBC08WTthWOK9XGFA7ftTwiScZQFWehKWCVZ+snZfqJhB3TUzyZR2zhT1cGV54Ms41d7pQv2wXY
 46/Qz7Qo8LAkqkpIaCg==
X-Proofpoint-ORIG-GUID: G22zFCLrRlk1riD7s__oXtsFOyZV9ybK
X-Proofpoint-GUID: G22zFCLrRlk1riD7s__oXtsFOyZV9ybK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070023
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

On 2/10/26 19:50, Yonggang Luo wrote:
> Name SH4 exception vectors and use the definitions throughout exception
> handling and exception raising.
> 
> Signed-off-by: Yonggang Luo <yonggang@gmail.com>
> ---
>   target/sh4/cpu.h       | 21 +++++++++++++++
>   target/sh4/helper.c    | 60 +++++++++++++++++++++---------------------
>   target/sh4/op_helper.c | 16 +++++------
>   3 files changed, 59 insertions(+), 38 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


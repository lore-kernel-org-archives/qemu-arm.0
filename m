Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84767C61DF0
	for <qemu-arm@archiver.kernel.org>; Mon, 31 Aug 2026 05:18:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0uPh-0002St-07; Mon, 31 Aug 2026 01:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0uPg-0002Sd-8r
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 01:18:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0uPe-0007ek-ND
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 01:18:32 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V52RHx3260465
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 05:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IgauRF8/I4KjHLy+2zW33LhmxIjpqAdXAMPG1GMuwGw=; b=T6HyT6CXMYapERh4
 QOQzJAPX91J8oK1snQWyuQb99omHffqNOoZGdinsZxdrNlT3qUv9Q5hCmW7ZZmof
 056HAVZY6hN6MEQtJJNQdxEBeWmSPZNapWbsxbkjo18pRmLtspczMiegyH1mfN7Y
 TcncJlcqPiBZwZPBaAgCT7NSVNYEkVncrsmNpW7L9zsrROlkskCg4Y0qvw497u66
 9hZS4qva0DnZIUEt/9/d0Ixk9wS87q+ys+w+JZePoq8CWkpllD+VqcKEdNhQHjxK
 gkVZm+tE4lY6k/+vPD6YDEaP0rbawJelQzux72hFm3MupZw9CQ8A9msUw2PQIALP
 BCTxBQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdfmnve-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 05:18:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93771aa0379so840240185a.1
 for <qemu-arm@nongnu.org>; Sun, 30 Aug 2026 22:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788153508; x=1788758308; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IgauRF8/I4KjHLy+2zW33LhmxIjpqAdXAMPG1GMuwGw=;
 b=PIl1pLDnTdFHZjkF10dAU4O7qHAsx8/V/DZl+tS1sKFKPtqw1ljss+mJJeTo1itAF+
 s37PpOdpXWzv9N5aEYHpEAmUE7cAMFJg8ldDHO4uc5RC6UL3p4CZ7ZB4+8+iSlgn4rJe
 KXAF5+OHju1kVdqRc0lXNJvKqa8zxeZv5GsRjTc3U6KEkVeNzklG61pI5wU/6XygNaNM
 R8aQzWdvcI6FLLUkCGIVfowj9H8dgAZyrvj5yvnbYDFPJ27q84Hq3BR1WxqF/LsDmrCt
 ZaRLRIx3TlQ4/yBsv/sEt763RNaNRVienDQb176r6KYUFh11596hiPAw4yJmp4ADi0xg
 JW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788153508; x=1788758308;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IgauRF8/I4KjHLy+2zW33LhmxIjpqAdXAMPG1GMuwGw=;
 b=mH3imQSGYwC9LkD8e1C/XsIahYTuwKKLYLo00/T+1xyz3eI6JPuJxFpIDop3aSYbag
 LQAYLxWVAUCr7pj/I/DQAhl6zLMCE6Zh51MwCVA98OMiW+SsO2e+B6NPaT8VpJMVPmYN
 TTVYtiQqEs3sUGvE+WDMvWagoW/VHrAWuxZ8m7MUSyRkNwIUqY5uMM4C8NUkIQoueDfs
 H6OcaIlgmJFM/C9veP89dqGyG5pF+BFQSwHgGcykcdlzKvMxV7KLlSxJrORLroxDZiOl
 +UrP/e9/7J9Yw220dtFlN68CcLB/kzQoX/9B7B28TRHjw5BMldetBIuDFesqey075MXW
 A2jw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rptah6DPUyi9TJNMZtKnptO8+O/JGD9LBACkLKK8ZEI6G/I4JEhMYo06eMOT8lKo463EmzEzYThiQ==@nongnu.org
X-Gm-Message-State: AFuF++nbF5G1apA1/O/+FB6z2DW+0J0B2jNYmxQWHnXU3ngxH1u49aIS
 7EEjWdKiQojxl4J9RmFdlwE1I4g6Vo66GJcDoYFvVRBzE4vrkLDGI35g65y6W538Rvo7ARO0f7r
 3ro1z0DQnx67rtNxZLR5pv2jLqlGjHPF9G6ioI3X3+pWkU6oysIfo3XQ=
X-Gm-Gg: AR+sD11JNQJlVfAWf1XqobyyfelX/Wfb2TyjUt8xoj9YF6YKfn4PnLv6BXrqwBVNSJu
 hPvq++Sh2nu176wsQ/Aj48D0q3mPadEH7jnkQ4z9OPhdf6mcnVkHcwC9FdUPw+xGAfweJh+XuqM
 DlNTLkxG1/yX5SI976YueT7KQsOi0pOFeUqt8+8/geSEC/ilG4XW83UAofwFprQAy/FPXfL93gQ
 KiiBaNDwtT7JymuuNDM6MLSSqUdyk6hj+wK8btz6RQvngxWFbeGxjTtCFoFb0+Lf+LswdDdXhY3
 L53rz8JGdtGbiArJiBK1zMyi7rOlxr8PYOJu61w007vcqqdmRd1u5GDP2h4fjCoZBv8V7Ub5sW7
 Hvty8rAPb7YUOj8cCJzBYHfdddZKF3/IXOA==
X-Received: by 2002:a05:620a:28c7:b0:936:d360:2eb7 with SMTP id
 af79cd13be357-93942b473ebmr54220785a.20.1788153507833; 
 Sun, 30 Aug 2026 22:18:27 -0700 (PDT)
X-Received: by 2002:a05:620a:28c7:b0:936:d360:2eb7 with SMTP id
 af79cd13be357-93942b473ebmr54207585a.20.1788153504617; 
 Sun, 30 Aug 2026 22:18:24 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ccd1e19desm212289445e9.1.2026.08.30.22.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 22:18:23 -0700 (PDT)
Message-ID: <1a9d192e-c3c4-4af8-adcd-39fb1253f01e@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 07:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tests/qtest/aspeed-hace-utils: Replace g_printerr()
 with g_test_skip()
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260831050213.381443-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260831050213.381443-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0MyBTYWx0ZWRfX9NPnuCJ5PuX9
 2tBnKfAqkvm41H9uJ6zuhbg5GoVhDjG1RxZp8RJJsDyBnFC+86h53123IGGxqOkuF1LyZCi6pDH
 3mq7qUgZuyQdnCn84jzeynGcElFQvL4tEI9C4leBPOTnyQj/7Tzc12ZVhq93XL5jS0ll6tmvLXG
 IfVHC8Ns1d1+gulIRwYWTEF8CMLriie4DDF6INdMtyGR8Am1Ib8xzGPdLjBm+dh01fN33IBs59f
 /XZDzOS0FRusGRLzSKxoif1fYbxc9kmAyDRupJYo7mfX1TeEprWen7bHmHqiJUFZ82Iu9o6sYNH
 MiMJdQTHIBvyBHcVLYVWER8RSN938rApV6vuYvw4QVouz5qbJe+PrUqGA1mVZWM+vDkDypqoRt4
 J/XOQrnXBiYtSdjM0JvcA2tV1LygChT6flaiBor4Ww2VJ1LgZZnsDBLU6p2XM3qkcmuOYQnrNqS
 nxqrNqh76gxM0D9yHWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0MyBTYWx0ZWRfX4ia4+0Hzgd3n
 JXUA1LI9L4jhTs6fjWAs4iUWsvQ78IpxxfYuFpwiPRaWXNtksil8ALemFemkescp6z/3ntw593u
 CJxcmpom/BzRFH6kCFKbmdr0iTouIQA=
X-Authority-Analysis: v=2.4 cv=B7eJFutM c=1 sm=1 tr=0 ts=6a950ea4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-GUID: hBS5fmAU7M0G_sRkt2BZtr3Zusx04icw
X-Proofpoint-ORIG-GUID: hBS5fmAU7M0G_sRkt2BZtr3Zusx04icw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310043
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

On 31/8/26 07:02, Jamin Lin wrote:
> Skip a cipher unsupported by the crypto backend with g_test_skip() from
> the test, instead of not registering it and printing a TAP "# skip" line,
> so the qtest does not assume TAP output.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   tests/qtest/aspeed-hace-utils.c | 24 ++++++++++++++++--------
>   1 file changed, 16 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081B7C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 10:56:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjEKx-0005Fa-83; Mon, 13 Jul 2026 06:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjEKw-0005Eo-Hs
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 06:56:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjEKu-0004hj-MZ
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 06:56:34 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DAfEdR732794
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 10:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YrYyCT8vzzgW9v1eb98IRSXqUawdDOedhrQ5pyZ00jU=; b=I6hUUlu1q/wBeZ0I
 5dl23V6B476NkTRV76DpLWhioG97Wpj1xbswiGUZw5UYETjNj0Xz994ZZqdqnhGu
 s4II3PIXfo8Ra3U4YBQ27O7jZS2DcdvfZyqfXetQEdrPcqjXobhtyUUSKrCxoiZG
 7gQSltkwp2Wg0ndiLVtxVo7mReMw3mjyYlrVh6K+SxTb8TT4MogPHfU27VLB5jrn
 9Dvpge9UKrs/MGurHuGSYbIwP6Ur3cA/mL5X96twCoVoJAZuXL5lQOZ5O4aACTBP
 tqBUXdnYF1IWkhwPKf1DnsD9kz+hPCwablCQpkSXxugZ+LfO/N/h/3hZ3RY7Pzh2
 bk8nTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3a597-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 10:56:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c07f25de2so30435711cf.3
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 03:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783940190; x=1784544990; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YrYyCT8vzzgW9v1eb98IRSXqUawdDOedhrQ5pyZ00jU=;
 b=Qw12tcjpymz7c+cjj2pgMpztdPBD/aDxq9PNytCx6QYSt4uTSR4Z/4GmukIqG/TzLy
 +qLebIRUBTAUVpKh8o+zhqK6mcEF1wArd2JyIQv3cwt6EZ78wUSk1SIeIIXc4SFgQJFp
 okeShsrSIo2aHe7liXUusfdSa7hz++p2UWcRBZUMwiPSAR2fOR+xmaJ0QnZrKTRfiCYC
 YQFp6X3FZk5GypE4YmTRe4kKZhJIMP4oi1mxcuf6HaRyg/x6dl1zyEWSIMGCgPz91YLk
 YT4vxUlWcug+z4Q+hT1T6qJoakJ8Dk+ISyX59i/UQbez9KGumPs3LB0xSt+XiOv/TeX+
 6W8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783940190; x=1784544990;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YrYyCT8vzzgW9v1eb98IRSXqUawdDOedhrQ5pyZ00jU=;
 b=ZO6IXpucRlvOlsooTWsayGeuk/hxOtsdPskXo+JizentK5CQmBzS1IkyYunDus8P/i
 OG+86Bb8s3xS3fKP8EZfezcWILcuhvS9jCrtVT6v2xLsyMahuH+aUkP0mYdWFsnmKHb6
 r0YkGb5uTGIhgWIKzPtt0CgP/Xgiowa7c6zP05ASoR4ounpwLL3peJtQfWEaW2C1ooae
 KWt+UPkj+ElmBmpKwE4mSeH+IRtu5DHqHIEOlVo0s8SeOIr2X2QbV3WfQoUZ+fihYz8+
 +e7QwMEvaND2LUxaLE0ms+L/jq1e566rkw3U30w+EzVVbIXQsgMMhKSEvekqDxhE5kO1
 eVoQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpU1dJJehLNSRgk5y1MRO6fxBfgrMiRhHGsFBMFe13X1KAeuMLKOoV5pTR7tb49r1B7ehVwCwPfvA==@nongnu.org
X-Gm-Message-State: AOJu0Yz4Tj+3yhwR5XYAoWbJscVnVSpk/csfMzcInuiwFZUiFVAzkrHJ
 wlx6g4/S0n3qE7tXdo6AXyyDfM+BWlaCl72h6BbqOZub1arn3i7626jsRhW1zKfrZQeD4OznUfd
 R/QFNLkdUV63f9LiooR19uQ34k2TfDj3EldetQ/ebBXcBDTv/NdwTQLw=
X-Gm-Gg: AfdE7ckY14vgTFr89xUz7ewANIuR7g/9wOa0g87XeGB8kYdgABtlNORCLq0Q4OGxT24
 bnf68ZFqp4VxhDckKkrLz2EbjIEh0DBYTDT6VsyhOTHAaK4CjgX945ZwVfkz3/KkmCAW1WLQvoY
 +NwZgKFsYAkpoDJs3PK3lOrJzt/VR20yRYkgrlexmOk4geQYYlkIUVu2P3yLn5l0EXAHMVDjm/w
 jvq6fjEBpvD6TACXd9dWM4VlZmLLy0uBF3n4uaukM2OJkwAJeKCaqqgOItHlc7IqaKSJ3YMrdrl
 o4mZzrKvHlRdnwZ2AwLUWLiry+UFiXs8rAo8u9ODdXxwDLhtKMWxJ5JTsNh1C7e2ttfeksmvcZF
 V/Ty+s57FseigFM7IZUw1AzMfNkRDK4M5mg9MIUiUViFbhbCktpHdNPkM3LPvyw==
X-Received: by 2002:ac8:5a87:0:b0:51a:8f3a:13b9 with SMTP id
 d75a77b69052e-51cbf170ae1mr87995851cf.16.1783940190403; 
 Mon, 13 Jul 2026 03:56:30 -0700 (PDT)
X-Received: by 2002:ac8:5a87:0:b0:51a:8f3a:13b9 with SMTP id
 d75a77b69052e-51cbf170ae1mr87995731cf.16.1783940190040; 
 Mon, 13 Jul 2026 03:56:30 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ff6casm424080805e9.5.2026.07.13.03.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 03:56:29 -0700 (PDT)
Message-ID: <047b30a8-2d31-4322-97ed-78208e0e121e@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:56:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] hw/dma/soc_dma: Remove union from memmap_entry_s
 struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jim MacArthur <jim.macarthur@linaro.org>
References: <20260710105907.2570621-1-peter.maydell@linaro.org>
 <20260710105907.2570621-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710105907.2570621-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMyBTYWx0ZWRfX0gv051SScpYb
 5XP3faZAb5XxBW01RSmswCxwTFa2ZpYTiMy5RUSdZ75w2ySNtNhNLdbeR1g5L2Kg+nc8GqEN9KF
 loKl/Mr6UuFg8qYWZXq1FymMERiFWQt5CW5/b6H3WlImVSg4QQsz1fdz1P+rWDUK7ex0UmwLOcs
 1pm8E9PDut2dRDkiMGKQXfde8Mq/ilUkGNvwmudJ2s5xb4CfJIm8X2m8i+PIKe+TdllSD7drQIf
 f8UPHDc3Ic398wB40tsDW00bYaNX+pVIcAdnYMt8gWKGZTn579xaxsyrjD4KinQn4JkZnPYmYYn
 pS97coCWwnJO3VXZXJPEU5kG0tebj9JqVh1Kobo7g4ppH6jGcUnGLkRThSnoXGy1uEOenyOw+0H
 zUA2hVV9zVaF3O/bEZSWlLHtZaM63qLrxPS8yBRxyGvOpMItBxhIV+JUykzcdtKFwR4B/ePAzBN
 ca00jNtBvbnqR2uI9oQ==
X-Proofpoint-ORIG-GUID: aOpNnJ1IrmgZbSYyKLwdLKKQxGvcs4pD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMyBTYWx0ZWRfX+aHZl0lyJnQk
 2UcNF65niebNgrOi0r06gpQZCVye22P3n7N1V9Bg9rA2597C17jfNlm2ear7QCleS1nfXnZo64O
 SSQSde1ZGIgmW3oZPHFj2Nn7B2nKzEE=
X-Proofpoint-GUID: aOpNnJ1IrmgZbSYyKLwdLKKQxGvcs4pD
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54c45f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130113
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

On 10/7/26 12:59, Peter Maydell wrote:
> There's only one field in the union inside memmap_entry_s now that
> we've removed the soc_dma_port_fifo handling.  Simplify by removing
> the union.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/dma/soc_dma.c | 22 ++++++++++------------
>   1 file changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


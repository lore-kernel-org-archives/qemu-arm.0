Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A274C79F99
	for <qemu-arm@archiver.kernel.org>; Sun,  6 Sep 2026 22:31:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3LNt-00089k-1H; Sun, 06 Sep 2026 18:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1x3LNo-00089D-VZ
 for qemu-arm@nongnu.org; Sun, 06 Sep 2026 18:30:41 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1x3LNn-0003yo-8i
 for qemu-arm@nongnu.org; Sun, 06 Sep 2026 18:30:40 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 686L9Xf31574106
 for <qemu-arm@nongnu.org>; Sun, 6 Sep 2026 22:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 T7+hjsdjeuo9ibCgRbgDRI2C873fyIJtwqFWCrkC/5Y=; b=Qi+EPKjng2JhKFCR
 HNTputdSo6ynYMrVdgL+Ip5EN/oBsGyAuWnHYBrApBJ0FO6jhqgKOQCoyJ0VtJdV
 GBvFie6Y9ULODrdyzObg3ybngWnBRK+kn+0HHVa7LH4sNEbmxcYGzSFEonr6Ekav
 13wSimX4jCE74aRV9j6mwRHjIGQBgNxQVjfxg65Dd6VRwR3k6Y85lHPuEBkEDDqu
 TM3UGG6mGMHEn+eaSm4+PKew3WYcqaEZCyb6tkd1E2BWRIW3HxiIfpORV8nUPaZl
 23xdvm8x/KiMrNB+cjCbfqGzPQ7w+B/Y69M83JW7hgYNkm6ggyUNww3RIncHKfQc
 xyvv+Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuem9ts-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 06 Sep 2026 22:30:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-939694871aaso480083685a.2
 for <qemu-arm@nongnu.org>; Sun, 06 Sep 2026 15:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788733836; x=1789338636; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=T7+hjsdjeuo9ibCgRbgDRI2C873fyIJtwqFWCrkC/5Y=;
 b=cgtK1tnfv2jr9JtzEYDaCJzYb0LMaQpMYkGhxUt5b648bSfRXc1zwINgJcNPg2cHsy
 i3LWbyUkxOlkt/H0T89JKIMbHd7hC1a1UWPnkSIrqv9D7GYOGf0i3QVe/Df9EaYoIt0N
 0PXfsxMUVjRWnnnEDSbtR5OMbDK2dJP3ytctGCz0cDh4+fVQHiTsudswkhjR9qlQ54F7
 JmOf/s9jYJ5a6gtS/vev8lV+gxqzAlPWGrmw2eYu5SA6pUFeEBUf2ghC3VDuiak+SSKj
 bAd5bkmu3tDc1GwTNxOq2WqiWNzyFwxFPcbn2HeJ+8KrIM5kDANqCFRY82ebxslY2z+9
 NE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788733836; x=1789338636;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=T7+hjsdjeuo9ibCgRbgDRI2C873fyIJtwqFWCrkC/5Y=;
 b=B7Sw1I7/RtjfkKIoCvCiV1aamQublezqzckGXFYpuj7OmTEbhPUNRe4Goljw2q8ZG8
 ghNEwTb1MQ2gc8s7lEy6p0NT+Rffn5ZHgkLZK8Ti8UpuM2qqqW/PEwGfKdwQ5BPrXDHh
 2mQBOKQZ4rYKYhp+hDCq7UaRvF7NvTCa/IXqm7Jn13wHSlDucDeIjIPgUZ3/wIgsZNkV
 MakNcYHZo1r7PcgoRkNITiNJtnlRBqr2lRxsUiyBGxwA5hmrVllZUXQugzO4HrRjmHP/
 AyTIxABBoCRGkOe+GfbUqwv+NveY79Ibm70n2mfwgGW25CkpookE1U2Vx2N6RNT+0t4b
 QDLQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwOwp3dfrUEnfDDo2NxpVbBBuZJ4pxlb2JtReYNxvJUIctse5GwuzO5H9X4VyZvYu/MRY1/2KJnAg==@nongnu.org
X-Gm-Message-State: AFuF++lRyQh0nJyDlF891UjsY2zu/lX8WfruJ6/Sxxm+M2/kyzHGlrJH
 HpOMzjtGfirz+W02vxob1raTKLnanhsultpJIENBebotYenGOnKelpqoTB9lrgil0r4WCUFEBXX
 mvExGewRQ+MTS4vDgrvHIqtENVAhwQi66MO/JYNptcjURq89WS0kTT10=
X-Gm-Gg: AYBFou3HOxS9WTUFCblK6JhalU72jAYmQ8yWurJNaT8uQ8pUAAA+a5nw42LcjCdKyDt
 AkH90hHGzvIFSh3Sba/HULnmpy4GH0nIU3gF8JAiKmfuSGmIOaptyu54wvXNQifyKM9a4SEDRfO
 BEEjYwul3dbi3dGHk9l7e8BG0sCCx8NDe8+VacVC2S3lCvh9FhyuElv5pNcXfS8oZacKZgwBpqU
 3c4Dr/9eO3tEhValN+aYiRCR4NVJ1ycfXT64jQgNTW5kKhfgBPvQoLbN3iTU8X/Ul8g6ngYRhIC
 vkpEgUoNfg3ZWk4GJ754NM4DujW6uF6xOLnmcSe3mMtF1hkypUdoH1OlRwUeDkhi4NsLGBDJoG1
 CVHBZx1fYbjlpvDn2qo4mCK/cHyN241WRrTBa26RzPMYAL3ILoyYsjkYENhfKoK7wMMlOdKG5wc
 1PyzG+
X-Received: by 2002:a05:620a:7087:b0:939:7f87:ff22 with SMTP id
 af79cd13be357-9398045fd75mr2008458585a.36.1788733836433; 
 Sun, 06 Sep 2026 15:30:36 -0700 (PDT)
X-Received: by 2002:a05:620a:7087:b0:939:7f87:ff22 with SMTP id
 af79cd13be357-9398045fd75mr2008452285a.36.1788733835953; 
 Sun, 06 Sep 2026 15:30:35 -0700 (PDT)
Received: from [192.168.1.199] (104-54-226-75.lightspeed.austtx.sbcglobal.net.
 [104.54.226.75]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9397fba2c3esm734805085a.36.2026.09.06.15.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Sep 2026 15:30:34 -0700 (PDT)
Message-ID: <75b264fc-779a-4ad7-a8a3-8b5c2a1312f9@oss.qualcomm.com>
Date: Sun, 6 Sep 2026 17:30:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] tests: fix qemu:func-hexagon-linters
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 Gerd Hoffman <kraxel@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>,
 Jared Rossi <jrossi@linux.ibm.com>, Zhuoying Cai <zycai@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org
References: <20260906-nohmp-next-v1-0-2b21e63974f3@redhat.com>
 <20260906-nohmp-next-v1-1-2b21e63974f3@redhat.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20260906-nohmp-next-v1-1-2b21e63974f3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfX7O4+A+lfBhM3
 mAkw7N4R2mcZgNyqxXKS8ZtMJUrn3QRGa2jgSkUyA5Rsd1yb3zwsfTxotQentGdT2SXP0Dw84Q4
 Q1N0gD2yKiIolRq/koLRX4cWNu0+m5p7tTiC1XNBHraLi+I7xfsXdlvLIUFwWKrwgnW0HO+RvJI
 NdG53vUrtCGnuq5Emt7JvB7zhJyndr3OhvYwzut/2fX9wOEye+6AuhR6/GGDl5++8hZqryn7Q3k
 s149eeitBkaH5ys+fyi8L2hJ+6k7jfzGujZquB1kvo7+VTRGyJaD0X97RstlTnEhCPVw0mePsmz
 1dN+wAyJPbxieJDTvhagKnlfgV6Qd8EsF/y57zvpu6bRCnef9qrkx6bQNixQR4RYMUGeKJTm9eb
 xJQ1q3LViQIVigdleMXSCsls7DyDv3h+O80nNyN65GXC4W/HNi86L1p6dgLqZldg0Hm4MQovhFm
 FeAcTdWGNaRhC6akbKA==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9de98d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=x6rl1zRT+JsLSO7OGbGBKQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=L-hIhnrybQUmc0PeswwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: A5LQiNh-WVC5tVgjldd9C1C_PVijj-rC
X-Proofpoint-ORIG-GUID: A5LQiNh-WVC5tVgjldd9C1C_PVijj-rC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfXyTNdCpG3JHuC
 hVK0Zaqy1iqxD/Ql280jp/gRqRhNzBm3cKjLxjByLcvKKIOnI/MrdS9Bl/ITWT0DfUOp40E/57Q
 g3yP27hz78p6pZMMwEHADLhDSG5GPY8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060252
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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


On 9/6/2026 3:53 AM, Marc-André Lureau wrote:
> Fix pylint W1514: unspecified-encoding
>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---


Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>


>   tests/functional/hexagon/test_systests.py | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/functional/hexagon/test_systests.py b/tests/functional/hexagon/test_systests.py
> index f36e015f5021..4b0546e7ad30 100755
> --- a/tests/functional/hexagon/test_systests.py
> +++ b/tests/functional/hexagon/test_systests.py
> @@ -65,14 +65,14 @@ def test_fopen(self):
>           import tempfile
>           # The fopen binary has a short cmdline buffer; use a short path.
>           dummy = os.path.join(tempfile.gettempdir(), "qemu_fopen_test.so")
> -        with open(dummy, "w") as f:
> +        with open(dummy, "w", encoding="utf-8") as f:
>               f.write("valid\n")
>           self.run_exit_zero("fopen", "-append", dummy)
>   
>       def test_ftrunc(self):
>           """ftrunc truncates _testfile_ftrunc from 6 bytes to 1 byte."""
>           ftrunc_path = self.scratch_file("_testfile_ftrunc")
> -        with open(ftrunc_path, "w") as f:
> +        with open(ftrunc_path, "w", encoding="utf-8") as f:
>               f.write("valid\n")
>           # Sleep 1 s so mtime change is observable
>           time.sleep(1)
> @@ -83,7 +83,7 @@ def test_ftrunc(self):
>       def test_access(self):
>           """access checks R_OK|W_OK on _testfile_access."""
>           testfile = self.scratch_file("_testfile_access")
> -        with open(testfile, "w") as f:
> +        with open(testfile, "w", encoding="utf-8") as f:
>               f.write("valid\n")
>           self.run_exit_zero("access", "-append", testfile)
>   
>


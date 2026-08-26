Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E35C61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 18:35:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzIT4-0003Kv-SF; Wed, 26 Aug 2026 14:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wzIT4-0003K5-8u
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:35:22 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wzIT0-0001Do-HH
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:35:22 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QGuc0V901428
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 18:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EgtRxXKiRk5UqE+cedh6Dksiua6bRppFIIGQWlGP/+U=; b=hrm5fWZkwufA156e
 wR9jUu3WuaGr6cZPPfH0/yxo2SD0sjIbR7SLgFuhK7oJDvK7PJexkq75b9phzuiW
 7F39pGwxLYB3pcdAacNZxV6SI0Orcvuevz0Yjg/R2wbxC0sS6bqeWgWgsUvDjZm1
 0kWTSX3hAfUSTLqeJNQRpyP6U/EWrwx8GwYpyEleEN/da78iWQBOaDUsSXO/v9/c
 6sYyOWWNAttr11vJ8MsfDh5dFj15EQkmntg/ZAsI3J2v3MgLHxNeQZ2tn5/oiKy9
 6dcW2YOAdBJVo/07OV6uPDj76WkynnZ53aQcuuYRIWBJQmVlHtbs86uUSdvpHooM
 A03Isg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03u1j17-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 18:35:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cc1b80835d5so1412092a12.2
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 11:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787769315; x=1788374115; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EgtRxXKiRk5UqE+cedh6Dksiua6bRppFIIGQWlGP/+U=;
 b=K9JKUPLwLJBUthN6jsZQAYiyhzLnYJ8iWzSDpoQaiLEu7Qr47XF8KvnMOOpd9Nq4ii
 DXHXI16nvNdylsqVYoQgNWu0K5cQyv8W0u5h2LVE9ICu+2SVv2k2Ay8hEtu4upD0evIq
 bxGG8YbFHNW9jtTvSiqg6cBSfNjDyp2WO1dEWBrhjJz/s6YbCijZBJVmItvNgDBf35RY
 LwMjZyatVNEmfkVNWvaFfYKTJHLLL8QNpayB6DDhvdFzSXUIaT3tti3kkEYa10DkJIDr
 Gzr+mCzex8+KxEaflCbEi5Xq1NprLCKxw8kinIaAuDF+X/aKIncuwkIRm+jUB2riOkh+
 tvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787769315; x=1788374115;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EgtRxXKiRk5UqE+cedh6Dksiua6bRppFIIGQWlGP/+U=;
 b=S5MDJ6Cg+Krr9JXAuwV2LMuoCJtdU03HsO6fi/ZWFigCuzT6PXdRM8aTAF3GV3XRNd
 EphTMtHQMWLzUbkbgxxn49LBHXGZp8WQrxvQsdxqDuDgMHERaMxFtUsmMfSEGq7bayli
 /eawuLjL5QPk0oXNM2zm4r08Eud3ON+4uKh0RubZyoS2/HSLr4loIlGBi8sjDDetFZhH
 2UF9Cqq0hcEzou1Tx2ysQamM3359b7PXWRB1FLOJqy+uJD7m6Iy6/zwBuYWc+ls7/rFs
 39pPmP8EzntuXqCK6aeb/hwcv5VVCI0K4ObKCg8lkbsgxkXlmdkblqW4VaWSqE50lur8
 h61Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrKqcsIP6VF64a8tBFM9fWmfZXFw4xbsAnsA8+TthUnWmxI+ABFuDHObzIDxeEy3Dy3IGfr/B1Gtg==@nongnu.org
X-Gm-Message-State: AFuF++kHUCgYioc5Dx6qC5h/NR+vpZPgos+0r3JnxKMiV9Lmic+xQGDo
 WLbb1/X5Je8ey4uZg9EHyYCzqxT2XnmSRIxq4sYD0mJNEm+7OV/GNjLsE447kT2rIcJcdf7/qrG
 6akzCyFSnth0Eqp+UlwhuB7tQOnnLU9bLg36axNepAPMt+vg9QSsmKJw=
X-Gm-Gg: AR+sD12dQFqOznpxhfaRtkWkY4jj3VJCdsO2HQoh95ZzbEIoVyzJu9s6b/Tt2fxLDTR
 nElXsEUXa+85XUNZy7fjMe14Xdud2DgQcQUuN5SHtZHSGxrOkYrP439VJM17vkXGkLcrZ4U4GcW
 vc4WP8Y7HxuGefXMHpqSXZ4VRYsD10CgeBsV3kq4ozAgxNvGX3o465ola78ylM89NZRnZB4+mcP
 TUdJFvgEBvgccPSfQBzE7Ec3qqH3ItHPXQYPKQ+dRzbZHQQwD7lMzVwkPiJVZO+qk8FTyNLKSdp
 KExBRP6uIrYp+pAektdjlqKBzVN+1EZInneiQxaiNqTNDCSpiG2Ll/HbJqbJbzrLXbxv8oIJ2I6
 gwn78fjH/7XO9m51H3842o8ZvqFybTu69G4TIvalG5CCK1ZuApdsyG5R8w7VREChNMgxm
X-Received: by 2002:a05:6a21:e081:b0:3c4:3112:33 with SMTP id
 adf61e73a8af0-3cf75f83f45mr14879854637.6.1787769315169; 
 Wed, 26 Aug 2026 11:35:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:e081:b0:3c4:3112:33 with SMTP id
 adf61e73a8af0-3cf75f83f45mr14879733637.6.1787769314648; 
 Wed, 26 Aug 2026 11:35:14 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3283d7303a2sm10831709eec.10.2026.08.26.11.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 11:35:14 -0700 (PDT)
Message-ID: <b2b1d77e-c3e3-4aad-87d2-f5d4834abd1a@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:35:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] single-binary: link ARM and RISC-V into qemu-system
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-devel@nongnu.org, Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <ao7c-FiawF9sMCGj@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ao7c-FiawF9sMCGj@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE1NSBTYWx0ZWRfXx2k4Z9qyUSFN
 JvQhF1v5X2xmxMcI5vzh3+Xwp/lzqmEL04AFeaDuZGI6xyctjCiBbQ/KeZnlvKHhXMcpRGOaPA/
 Qm/ZupLxHCNox2bvbbueoQMPsuPbaPQGDXY3jP+ZHMS1+uDr06eb3y644BM6dGNG2EgBBg+wVGB
 s2K/DXkDm3bKEXqW8SK6Gn5PWNqieu5iVun1fyllja4yNkwQrDXT+GAGt49w/TuRvQBsI5/mZJm
 LZdzCPMtNkxGpNgv9FAZHwYpoBKTsK9+8J3iy/AxbvSgX0GNJF1yFJMcEun27v7InFQv6BE6uKZ
 QPZcOfWScXWmUDff6l7VuiTuyPCIUBqEFSSMkjsfuxLYFP35jIB2vj8nTBNUD1ns8073rEwq8VS
 9xPtEkBjd0LxtyzBiR2EGlQy+OI0WWD2Dx/ro/5dReLyq/dndzg6YTeZJPWZM0adsyP19SNzJNd
 WGM3oDIllQ8lKftyGrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE1NSBTYWx0ZWRfXyQF8jp3o1dYc
 PKsdwnxVkdi6ETVdQbfhBdoA6vlXLWqD2rwXLoS9J/pvSCNlLA4YpMCEzGLDD+QOx6XNl/QLbjI
 +qrTLZAMwaPcCEYi6dQ4P4w+R4t1BGY=
X-Proofpoint-ORIG-GUID: iCiOkjG_k1YwXGHEPpzgt94i8edf7qJu
X-Authority-Analysis: v=2.4 cv=RcqgzVtv c=1 sm=1 tr=0 ts=6a8f31e3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VVQjpIOwF65EuUEall0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: iCiOkjG_k1YwXGHEPpzgt94i8edf7qJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260155
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

On 8/26/2026 5:32 AM, Daniel P. Berrangé wrote:
> On Sun, Aug 23, 2026 at 11:07:18PM +0800, Yonggang Luo wrote:
> 
> snip,
> 
> ..to comment just on the end result for now..
> 
>> The last patch builds qemu-system (and qemu-systemw on Windows) from
>> aarch64 common/system objects plus RISC-V arch objects, and installs
>> qemu-system-{arm,aarch64,riscv32,riscv64} as symlinks so argv[0] still
>> selects TargetInfo.
>>
>> Examples:
>>
>>   qemu-system -target aarch64 -M virt ...
>>   qemu-system-riscv64 -M virt ...
>>
>> A basename that matches no registered token falls through to the unique
>> default. A combined binary with no suffix requires -target when more
>> than one default TargetInfo is registered.
> 
> In testing and comparing  the new qemu-system-riscv64 symlink
> to qemu-system vs the current standalone qemu-system-riscv64
> binary there are some significant user visible changes.
> 
> The simplest is 'qom-list-types' went from reporting approx
> 770 classes, to reporting approx 1530 classes. IOW, the
> qemu-system-riscv64 binary is now reporting supporting for
> all the classes that were unique to arm.
> 
> The '-device help' output similarly shows a great many more
> devices
> 
> TL;DR introspecting qemu-system-riscv64 is no longer accurate
> wrt riscv64 capabilities. 
> 
> This is not suprising, since we register all TypeInfo meaning
> we get all QOM classes present. Some of Pierricks patches try
> to filter places which iterate over classes, but this does not
> have full coverage.
>

I would add that if you would focus on reviewing and helping for this
filter problem instead of reinventing the wheel for command line, it
would be solved by now.

> 
> I think this is probably also what leads to the increased RAM
> usage in qemu-system-riscv64. Starting
> 
>   qemu-system-riscv64 -nodefaults -display none -M none
> 
> shows an increase in RAM usage from  17.3 to 20.7 MB which
> is about 15% increase. NB this is dirty, private RAM per
> process. The shared RAM pages also increase but that's not
> a concern since they're common to all QEMU processes.
> 
> qemu-system-aarch64 shows a much smaller RAM increase, since
> it only grew from 1430 classes to 1530 classes.
> 
> We have many more target though, so if we assume the end
> point where every single target is unified, the the union
> of all classes for all targets comes to approx 3600.
> 
> My guesstimate is that would mean a memory increase for
> qemu-system-riscv64 from 17.3 to 39.9 MB, which is a
> 72% increase.
> 
> In absolute terms this is still modest, but for deployments
> with large VM counts  and small RAM sizes, that gets to be
> significant.
>

How surprising (:eye-roll:) it is that adding more code and more classes
would result in a higher memory usage, or bigger binary size for
qemu-system.

More seriously. If someone is concerned about it, the simple solution is
to restrict list of targets and/or Kconfig to include less.

> 
> None of this means single binary is a bad idea.
> 
> 
> My main takeaway is that we're creating uneccessary work
> for ourselves by trying to make 'qemu-sytem' identical
> in behaviour to qemu-system-$TARGET.
> 
> The complex filtering patches / QOM interfaces that I
> found uncomfortable in Pierrick's base series are largely
> around the filtering needed to simulate qemu-system-$TARGET,
> and they're still incomplete. I don't have high confidence
> in our ability to avoid regressions if we go route this
> route.
> 
> 
> IMHO we should make a clean break with the past. Leave
> the existing qemu-system-$TARGET binaries being built
> from the same pieces they are today, such that there
> is better confidence that we are not making behavioural
> changes to them.
>

Funny enough, it reminded me word for word of a blog post from a
Microsoft employee where he explained that powershell existed only
because young developers were scared to modify original cmd shell.

Regression issues are solved with testing and good design, not by
inventing new things.

> 
> qemu-system should be built alongside qemu-system-$TARGET
> and offer new semantics where it is documented as exposing
> everything from all targets whenever introspected and does
> not apply target type or target Kconfig filtering to inputs/
> outputs. 
> 
> We still get the benefit of only building most  .o files
> once, so keeping qemu-system-$TARGET is only a small
> overhead in the final step of linking everything together.
> 
> 
> qemu-system will still have the increased memory overhead
> but that's fine as qemu-system-$TARGET will be unaffected.
> We can tackle the memory overhead of qemu-system at our
> leisure through use of loadable modules, and thus not have
> that as a task to think about today.
> 
> 
> With the clean break with the past, we also have the
> ability to tackle various long standing design mistakes
> present in qemu-system-$TARGET instead of carrying them
> over into the new binary.
> 
> Specifically
> 
>  * -nodefaults should become the default
>  
>  * All CLI args should be processed in order from
>    the command line, so we eliminate the nonsense
>    where we process some -object, then -chardev,
>    then more -object through hand crafted deps
> 
>  * No default machine type
> 
>  * Drop all legacy syntax so we only have a single
>    QAPI based way of configuring.
>    eg drop -hda, -hdb, -cdrom, -drive, etc
>       only keeping -blockdev
>    eg drop -mon, -monitor, -qmp, etc only
>       keeping -object
> 
> We don't have to do all that straightaway. If we declare
> qemu-system "experimental" initially we can iterate on
> that intentionally breaking compat in releases, without
> any impact on qemu-system-$TARGET.
> 
> Avoiding the back compat task will give us more flexibility
> with the follow on work when people come to create new
> machine types with heterogenous CPU targets.
>

Seems like the Genius.Artist. in the bottle just need to escape, and you
can send us a nice series doing all this. Meanwhile, I'll try to find a
carpet, a monkey, a princess and a suit to be the next Aladdin.

> 
> With regards,
> Daniel

Regards,
Pierrick


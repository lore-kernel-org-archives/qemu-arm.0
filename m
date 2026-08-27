Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F70C61DB9
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 19:58:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzgEs-0001FN-IE; Thu, 27 Aug 2026 15:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wzgEr-0001Em-Vl
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 15:58:18 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wzgEn-0006FO-Qy
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 15:58:17 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RJLs69653884
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 19:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JQXYSBIdz8+sV9s2v1Ri85eaqZcin/wN5fCctiv1VME=; b=i31j4bL94RJFWF0W
 sVVjuP2Zk3Y4/E86Y/IqdxGoEf2RnIg50OQTiaO2Zk96wNMgDWpuPConSKbTnLgC
 a5/bPiNO4+wcqb8HhEbbhp2x8BYGsMMBQsbC50bjl/92MM3K4k/n3CkvTPiJDqFP
 wLPZq6MW5uKm5IZ2gEAJnK8EqxXB0eylgmYQ02KfCtMlm/Otnhu2fkoO1iVhrLVo
 seMhNvqyQnitjIT7+aX9bUxAuW03O+HGedIADvxW0fKTTZ+mRyYuwXSsfp1ZVx21
 sYRVw9RCJX+eLv7JT7Pbsc6a3NliTuKKJPOxCCqzX223ypRA1RgxU3zgnkdRh3JS
 0GWovA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gagjfu3py-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 19:58:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cc132709c76so434499a12.3
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 12:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787860690; x=1788465490; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JQXYSBIdz8+sV9s2v1Ri85eaqZcin/wN5fCctiv1VME=;
 b=ZzYFNLGi6dWAaGo5pgf2TJn4BFTlgIrrhpm2Zn8f0O//vLPmUONCJP6GeEy7i0IhIl
 hWwAlR86RnVjZsJI8j0I1aAEHoifsNYblauXdUYBe48+FhFAyfX0o+gtJMGOFZggL8JB
 mVBEUQ82Aj8BDYJG0AaqcUUvdeiv/R/i3z3UJlwkbClqpZNbNeduaN16j8loF7QhMOrR
 sNlsZ3JlwnXirFjcfHpfrfWmYaIbaeOGtsHgonqLgyXYSpadytcPwNT0/91phAXlPLHK
 /c7DklnuzBQHEAw9gbDUklXukuE5ATd0ivFLzpsjR4dwbv+clBoKgndOly3MnEuxcnvM
 8HKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787860690; x=1788465490;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JQXYSBIdz8+sV9s2v1Ri85eaqZcin/wN5fCctiv1VME=;
 b=ImAh+vIROXzEHiZMEmh82OnB4IigjGEtmSyiyGYgb3+JYyRM3z6DPDulxCrrTIgJlP
 mvQLGC10TnbbKhse/RSwecQIEakypX1iMGLaIiXvMXG90nA+pSlBn4z8B0EF2sx4M1DL
 hPW2LFLbVIoBEXF1lbsebTmCgMB6zZEvzSdvCwdf6yfKlUfn3+BnPon3xL72DTlfHEji
 ii2K7qJrsH3Cz3DZANax9toIguUA8y2vWh8NtSKs6qCY+sxYhKXDK/aFv17BhZ71QdaX
 vWGVO3GdnIYPIMlL0eStv+GFGj1Z5czTe65ljD/UeCGd2g6MzeXDGcn8eSQSR09P1c1y
 3IKg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqCyBbtkXvU2PRevo6NOx6j3rEagRqkOR4qUc27e4EMDn+/+aKbuWpfQUZCIY2sr6FgtwIQZBdpKA==@nongnu.org
X-Gm-Message-State: AFuF++kjOoYRdqwsgfMUomIHvsXRnN55a0uE/HMXpw7kHfEXcg70iTzP
 7SrPxk5obj6CtBQ3VFUApDGk1ZXOzucNgEWb/ZQ2L7ghPTWeL/qD3Zyv8spOsZOzBfRlBH1KImk
 eb6qrvBihewL/L8EPjQIM8eqfwiatio1839gTxsLspzoP+GSO4BhvXvo=
X-Gm-Gg: AR+sD108iYvoIhuJcF/vQPhJP3TsVMumNIpA431Ld8m9eSyK3YjEbstYfwUUREQZsXo
 a1jqELfq3k2tWvNOS6mn93BqDzqwLr8+rKPDKOCu9FtwLWp8qlGG/TqUoHTid8wFFMKVKREYzSg
 b6JUAalskQz97xQp4W2YFajpJQm9QatDvFhldjZ1ng7qXXXXmoIs2dIRfyuEUjmERGJXeVM/Vd1
 C+7WMgaRq8MaVZYO90+vBvKmsGKtOje/1zRTFLVpsWVIuPWweRAUufdSGyqfjCV3o7xJNxihKad
 0mH31h2jArpmy8mNyMdYw9zT6hq5zx9Wj0TneV0tAszDf9SKwsn0CCbnnG3JFxhOgC6OgKlp0LX
 xXpd3RL+Vy0aX6ckWGjIDTQ0bz27MbL2/3JKcHXeB/2Mx5e0ZpywIaTLrho8FXnv0Xwpc
X-Received: by 2002:a05:6a21:a09:b0:3b4:61f:1fec with SMTP id
 adf61e73a8af0-3d26668474amr3152922637.2.1787860690123; 
 Thu, 27 Aug 2026 12:58:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:a09:b0:3b4:61f:1fec with SMTP id
 adf61e73a8af0-3d26668474amr3152776637.2.1787860689541; 
 Thu, 27 Aug 2026 12:58:09 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-141a905cf38sm28218017c88.12.2026.08.27.12.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 12:58:08 -0700 (PDT)
Message-ID: <997fad72-3d6f-4ec6-9017-290959d9848f@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 12:58:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] single-binary: link ARM and RISC-V into qemu-system
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org,
 Xianglai Li <lixianglai@loongson.cn>,
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
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <ao7c-FiawF9sMCGj@redhat.com>
 <b2b1d77e-c3e3-4aad-87d2-f5d4834abd1a@oss.qualcomm.com>
 <apAG8JQTnQxRkfip@redhat.com>
 <9e36f8a0-5363-4ce2-accf-62ccf3602344@oss.qualcomm.com>
 <CABgObfYw8U6q1xdUXcP5XBNTpB-n9MR=DkzFXpb6nkn7g00etQ@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CABgObfYw8U6q1xdUXcP5XBNTpB-n9MR=DkzFXpb6nkn7g00etQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6y1x3wSRY_NMq8LZ_W2yseh60pw_zyR-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE2OSBTYWx0ZWRfX6NN67nO3JGt+
 gI4SDtKFrDfZTFAFJvgevjAwFNtArcYRKb4AC5HZyFj2flrh6V8kG4CqH4tkrfqApl57MLaGwxC
 P0vY8a7frSFPudCNYAQwuKEsy+8HJPl8ykxOhIc/96CwMWmbKyqLKDgEiXANGrxKNQqNnN+K4jo
 3aRYZVoa5JOk7US9zhxer90k9SIQ/dM0al0XotELxA/R7sVZjEwl/8vLV0lDXPskj7WtQM6LhjM
 NkeUguWyepK0vSkCaVdCnYafH5xm+6+V+FlXVy4P3d7jzmh7lpA+mp8FNTxwaWKgpN5SG7d1uBe
 V61pc4HUqC/qh+tUksUCwHUekfVFU4s72iikdzTTx3QMp6tG2reukzXdfHMSfowWmAP+9gvaP4I
 y/azhXuAi+vsRB5Zo2MVIfVmNGQy/+j+TdLXlLnFrjrlQzEqQ7fOgzbEF/1dB3mk2SNMYxeSsYK
 rvqu48okCP8xqCJttxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE2OSBTYWx0ZWRfX6O2+IrtzdQ0i
 OFJF9U/RsDp8NeLVqu449CQ5e97F0MPSnl508jgyNmuakkRcivsY/DHOIPcqgruoR634/7aPhn3
 S3fdZwOPhIk8rXSyWEsWafKWdwctgxg=
X-Proofpoint-GUID: 6y1x3wSRY_NMq8LZ_W2yseh60pw_zyR-
X-Authority-Analysis: v=2.4 cv=dd+wG3Xe c=1 sm=1 tr=0 ts=6a9096d3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=GaQpPoNlAAAA:8 a=EUspDBNiAAAA:8 a=Um-vdwUetMyfWOKDL2cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=xF5q_uoM5gZT5J3czcBi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_08,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270169
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

On 8/27/2026 10:48 AM, Paolo Bonzini wrote:
> On Thu, Aug 27, 2026 at 6:32 PM Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 8/27/2026 2:44 AM, Daniel P. Berrangé wrote:
>>> On Wed, Aug 26, 2026 at 11:35:11AM -0700, Pierrick Bouvier wrote:
>>>> Seems like the Genius.Artist. in the bottle just need to escape, and you
>>>> can send us a nice series doing all this. Meanwhile, I'll try to find a
>>>> carpet, a monkey, a princess and a suit to be the next Aladdin.
>>>
>>> This kind of comment is not productive and disrepectful to the time
>>> reviewers in invest in looking at the proposed patches. Please stop
>>> this.
>>>
>>
>> The only person wasting everyone's time here is YOU.
>> There is not a single person who came on any thread to say "I agree with
>> you Daniel", while several posted or commented they were ok with the
>> approach here.
>>
>> Project is QEMU, not Daniel's EMU.
>
> Whoa whoa.
> 

I apologize to Daniel, and other people on this thread for resorting to
sarcasm in this situation, and personally mention Daniel in my answer.

It stems from the fact that it's not the first time Daniel come on a
thread to push a view (that might be wrong) and don't listen to other's
people opinion, or leave the conversation when he has no more arguments
or discover he's wrong. I'm not the first one to discover this, and it's
a topic that came from multiple people I met. I invite anyone to tell me
publicly it's in my head, and that it is wrong.
Neuroatypicality does *not* justify passive-aggressive behavior. We have
many examples in the community of neuroatypical members that still are
open to different opinions, and don't act this way.
I don't see it as collaboration but as "I've been there before you, so
do what I say", which has absolutely no technical basis, like it should
in our community.
I don't know how to fix the behavior described above, but since Peter
and you manage the community, I'm open to discuss about it. I'm also
open to hear "Pierrick, you are the problem", apologize and accept it,
learn and keep on working with all of you.

In all cases, it does not justify any personal attack, so sorry again
about this, it won't happen again.

> Sometimes people don't reply not because they disagree, but because
> they trust the people involved to resolve the problem.
>

We presented a plan a year ago, for which multiple people have been
supportive in general. Now we are close to having a single binary
upstream, we have Daniel coming last minute and asking to solve issues
we are not at yet. I feel it's not helping us, and simply blocking work.

Daniel's main concern (correct me if I'm wrong), is that we might
introduce regressions by introducing a -target option, and filtering on
QOM types. I don't see where it is a problem. Even if a mistake comes,
it takes a single patch to fix the missing type. So I asked several
times to postpone his desire to refactor things, but he keeps on coming
and blocking work going any different direction.

I have no problem with anyone deciding to refactor the QEMU command
line, but it's a different problem from what we are doing now.
We just want to provide a first version upstream mixing at least two
base architectures, and providing exact same behavior than existing
binaries.

> Let me remind you of the discussion we had about -fms-bitfields and
> how it was resolved amicably and profitably.
>

I really appreciated this exchange with you. Even if I was a newcomer,
you explained where you disagreed, but accepted a different answer. Then
we iterated to prove that existing struct layout were not impacted, and
we both observed it was safe to remove this option. I felt like we both
worked toward a goal, and not that you pushed your personal vision
without any technical basis.

> I will read the thread and try to understand what's going on but from
> the first impression, "wanting to keep the single-system
> qemu-system-riscv64 instead of a symlink" is a valid objection. In
> fact, with the proviso that I haven't read the code, I don't see why
> you'd want *anything else*.
>

There are other threads you might want to take a look at to have the
full picture:
- 20260821235112.193381-1-pierrick.bouvier@oss.qualcomm.com
- 20260724000948.234657-1-pierrick.bouvier@oss.qualcomm.com
-
https://patchew.org/QEMU/20260514172303.1484273-1-pierrick.bouvier@oss.qualcomm.com/
(v2-v4 for a concrete example of pushing things in a direction without
listening to arguments, and not follow up when discovering things are
wrong, thus blocking work).

> And especially, "How surprising (:eye-roll:) it is that adding more
> code and more classes would result in a higher memory usage, or bigger
> binary size for qemu-system" is not a good way to conduct a
> discussion.
>

I apologize again for sarcasm.

> This project was extremely complex and some disagreements are normal,
> but overall I would say it has received support from the community for
> years. It is close to the finish line, let's not forget all the
> collaboration so far.
>

At this point, I don't see the finish line coming anytime soon.
We are stuck in a situation where we now might have to design a whole
new command line from scratch, for a reason I ignore.
Meanwhile, we fix downstream regressions on single-binary, and it's
exhausting.

I would appreciate if you, Peter, or Markus, could decide something
here, and explicitly say:
- let's go with original plan, and just introduce -target option and
call it a day for now. CLI refactoring can be initiated in parallel.
- let's change the original plan, and Daniel (or anyone willing to) can
design a new cli for this binary. I'm personally out of this.

I would also add that a new cli is completely unrelated to
single-binary/heterogeneous, and it could already be
designed/experimented with a single target, without impacting current work.

> Paolo
> 

Regards,
Pierrick


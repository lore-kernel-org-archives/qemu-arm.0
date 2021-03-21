Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2921870lfg;
        Sun, 21 Mar 2021 09:29:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+b4+dwDiP1rWK5daPhMc4iEUo5QvT2/iSaL2kiFkg3QyLPtwspXa9bPzmv+uXidcQp0AV
X-Received: by 2002:a05:6e02:1546:: with SMTP id j6mr8609679ilu.75.1616344148534;
        Sun, 21 Mar 2021 09:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616344148; cv=none;
        d=google.com; s=arc-20160816;
        b=v4Pd3hWkRy0j4rWSZV/vnIoq7+cAeWFsFF1U9ZU8/y2v68TfPRxTQ76JBQ1fmpN6OX
         oLKAdVwZf405nobw7rwy3SP4Ilswwo+QnEU8pL2wvDRSUAa3RWt1FL/+MgJsXmNGLsV7
         sdgYF3bvwcgDe/LFGFrRqW3d7Mj1lQaKXGgj5JWvXXRxI8HlP5nqJlWKdFh4YhWW0ADy
         xxpdWkzHCk9K4qSwIQlAB7NZ8DBDRZPpl1h5EDqvJtPDjarLrQ6eWAW31YZPwank64zj
         n1OgeBBS8x7tw2O1dTp0jPO8qrQI+nhTMIRJQU386WE1XSgofJv6S1J6nmJiLN6bOH3x
         mwxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=xLP10KcnN+99Qleh6SMMkJCCtty3WHkhG6kBnT16MIM=;
        b=S0uyI1AF5TepgHgwbcfQha+mRPE4YAP6LAORLP9MReDv99uPLCW7RCZXUXP65IYLuy
         Jfr2kLzekh0SgCxlO04f0NehphRbNSAJsj9QZDd0cUGHuh0atg8VzdZjJkS0DI/VVIc3
         5MsI1AgEEZxpJBvaOmmLCz6TDwwoqhntSwhqp7PFunNx+oYFQ6DLpgLijEjV7c7uWpG/
         LKefpqJJK0P80xWlRLNiYIv4DJc/1hKkl+ckZ1NN/w/KP1AIdyI0CeLrKqeyDhdKLL2h
         DjMlwyO5C+hTqP40EBFLXMFRwWn+z3b7y2g+TqLjDFe9JwOzh3aw0KuKUNs5uiYzMVwu
         AMQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20si6965036ioo.5.2021.03.21.09.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Mar 2021 09:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lO0wt-0002kT-Qz
	for alex.bennee@linaro.org; Sun, 21 Mar 2021 12:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1lO0wl-0002kF-J6; Sun, 21 Mar 2021 12:28:59 -0400
Received: from mail.csgraf.de ([85.25.223.15]:53562 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1lO0wj-0007C6-DG; Sun, 21 Mar 2021 12:28:59 -0400
Received: from Alexanders-Mac-mini.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id 4C69E6080612;
 Sun, 21 Mar 2021 17:28:49 +0100 (CET)
Message-ID: <cbf3a9a3-faac-e41b-c6d0-f1bd417904a1@csgraf.de>
Date: Sun, 21 Mar 2021 17:28:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:87.0)
 Gecko/20100101 Thunderbird/87.0
Subject: Re: [PATCH v6 09/11] arm/hvf: Add a WFI handler
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Peter Collingbourne <pcc@google.com>
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-10-agraf@csgraf.de>
 <CAFEAcA_KFzEERYJ9d8YbPjhCv1rt9O9w567xP=ECqixLie5nmQ@mail.gmail.com>
 <CAMn1gO4p4CDH7qVhNnTpOeo_q98iYBHgS2LLSe26q-3SQJX1Xg@mail.gmail.com>
 <CAFEAcA_zNdgAO-1eif_TO7cBD1uB09pbGnbjEhUz+RDX+k9vVA@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA_zNdgAO-1eif_TO7cBD1uB09pbGnbjEhUz+RDX+k9vVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pPGcTswO9apy


On 10.02.21 23:17, Peter Maydell wrote:
> On Wed, 10 Feb 2021 at 20:25, Peter Collingbourne <pcc@google.com> wrote:
>> On Thu, Jan 28, 2021 at 8:25 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>>>> +                if (!seconds && nanos < 2000000) {
>>>> +                    break;
>>>> +                }
>>>> +
>>>> +                struct timespec ts = { seconds, nanos };
>>>> +                hvf_wait_for_ipi(cpu, &ts);
>>>> +            }
>>> Why doesn't the timer timeout manifest as an IPI ? (Put another way,
>>> why is the timer interrupt special?)
>> Timer timeouts result in an IPI (via HV_EXIT_REASON_VTIMER_ACTIVATED)
>> if they become due while in hv_vcpu_run(). But at this point we are
>> not in hv_vcpu_run() (due to the aforementioned difference in wait
>> behavior between x86 and ARM) so we need to "manually" wait for the
>> timer to become due, re-enter the guest, let it exit with
>> HV_EXIT_REASON_VTIMER_ACTIVATED and then trigger the IPI.
> But WFI doesn't just wait for a timer interrupt, it waits for
> any interrupt. So it doesn't seem right that the timer interrupt
> in particular is being handled specially here.


It waits for either an external interrupt (vcpu_kick() -> IPI -> signal 
-> pselect exits) or a vtimer (kept in the CPU thread, handled by hvf 
natively when vCPU is running, handled through the pselect timeout when 
in WFI mode).

In hvf on ARM, the vtimer is handled specially. It is owned by the 
kernel code when we're inside the CPU loop. We don't even get vtimer MSR 
exits. However when user space decides to not return to the kernel CPU 
loop, it needs to handle the vtimer expiry itself. We really only have 
that case on WFI.


Alex



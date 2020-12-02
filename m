Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1577898lfb;
        Wed, 2 Dec 2020 14:57:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygCk5euuB9hEQm5/0ILhQjnpaqELpih+jeg6Z7nYwn/QZoS1ExPxWrtXEv7R8wIs8hDmXD
X-Received: by 2002:a25:76c3:: with SMTP id r186mr624309ybc.101.1606949845990;
        Wed, 02 Dec 2020 14:57:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606949845; cv=none;
        d=google.com; s=arc-20160816;
        b=XZhjSvQEavaJKJ4qfX6qWoepi5ClTeyls1SA87NOr8xpCYki77Zs5QAE9Jiulyklr5
         0ijQznvqnbSIIK5KwD0j2o7JgsEb/A4dTH/dJsRbG2gL13gsAvm0DiVo5yTUHwc5TT8X
         jQ02/HyH3XMzmuSwzbRqf1Kv1cj1q8C+iuyJ1PTSOIp7gmgCNcggEPzQ2OzPW3V79PMn
         YbKaPve8lDjZqk9Cc08yry322g1Gb7l+PN5deU3gOP/LK4VvRXFW1EFApxVdj2CaZp7q
         cfAEw3JgwPjVcZ457jqgPmX4wO1/watypdyc6PDtQ/ukH+L1E8TIofAUblStXHJ30r4C
         3lBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject;
        bh=6nCnDkV/MXQ362QbuHX3ZsulnEiTdQlaLr3KXssHrGs=;
        b=E8zZ+iu3189aO5tnlZIGoqJ6vT0S0hm35NqtqyjfyPrqVDIosTX6TukwFa/c9geaEh
         A5kZLTVKq+dW5G38f1P0P/jy0UWyVhWJnKLYnlBNoQuqyrtAQCA8WV1F9yURkl63jzys
         30MsQoFc5pbCe4PwcgwV03KRAsmTK1iLJluw/7o8Qa7dRr7uVqkpQhGXZxAzIJbPhnaQ
         UTqWd0+zJaYKTLE77BTXZvoulKeDEBeB5nwnz34xRxn2QVL5VS0FMbZDrZJSDN18POMT
         rhHRC0pUBBUZZ4AFV8Oznafua72668X65a7b3zgydmx0Fxh7259HHDdrn1gTWZq4sCtF
         7EFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6si64094ybl.73.2020.12.02.14.57.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 14:57:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkb3t-0001Sa-8Y
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 17:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkb3g-0001S5-0l; Wed, 02 Dec 2020 17:57:13 -0500
Received: from mail.csgraf.de ([188.138.100.120]:39804
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkb3Y-0001nK-Pn; Wed, 02 Dec 2020 17:57:11 -0500
Received: from freeip.amazon.com
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with ESMTPSA id 1E18D390036D;
 Wed,  2 Dec 2020 23:57:00 +0100 (CET)
Subject: Re: [PATCH v1 1/1] hvf: arm: Properly sync guest time on migration
To: Frank Yang <lfy@google.com>
References: <CAEkmjvXGccGs2QhaiLFupTDWcnp4O+qez-uj8QdbRG13UfCy2Q@mail.gmail.com>
 <2dc974cc-abe2-d034-1720-d5a2651a9042@csgraf.de>
 <CAEkmjvV-XPmBCGsOnBhZ20t6D+vbp+7pOUpDeMJL3dKAjZvErQ@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <658b1719-4635-edab-f3e2-6a9ac0bc01a1@csgraf.de>
Date: Wed, 2 Dec 2020 23:56:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAEkmjvV-XPmBCGsOnBhZ20t6D+vbp+7pOUpDeMJL3dKAjZvErQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------8E81D7DC2B5F2A2D3B1F9CAE"
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tR3rh1gfShyq

This is a multi-part message in MIME format.
--------------8E81D7DC2B5F2A2D3B1F9CAE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 02.12.20 23:46, Frank Yang wrote:
>
>
> On Wed, Dec 2, 2020 at 2:28 PM Alexander Graf <agraf@csgraf.de 
> <mailto:agraf@csgraf.de>> wrote:
>
>
>     On 02.12.20 23:19, Frank Yang wrote:
>>
>>     From downstream:
>>     https://android-review.googlesource.com/c/platform/external/qemu/+/1515002
>>     <https://android-review.googlesource.com/c/platform/external/qemu/+/1515002>
>>
>>     Based on v3 of Alexander Graf's patches
>>
>>     https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de
>>     <https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de>
>>
>>     We need to adjust CNTVOFF_EL2 so that time doesnt warp.  Even
>>     though we
>>     can set separate CNTVOFF_EL2 values per vCPU, it just is not
>>     worth the
>>     require effort to do that accurately---with individual values,
>>     even if
>>     they are a tiny bit off it can result in a lockup due to inconsistent
>>     time differences between vCPUs. So just use a global approximate
>>     value
>>     for now.
>>
>>     Not tested in upstream yet, but Android emulator snapshots work
>>     without
>>     time warp now.
>>
>>     Signed-off-by: Lingfeng Yang <lfy@google.com <mailto:lfy@google.com>>
>
>
>     If we just always make CNTV start at the same 0 as
>     QEMU_CLOCK_VIRTUAL, we should be able to just recover the offset
>     after migration by looking at QEMU_CLOCK_VIRTUAL to set CNTVOFF,
>     right?
>
>     That would end up much easier than this patch I hope.
>
>
>
> The virtual clock interfaces/implementations in QEMU seem complex to 
> me relative to the fix needed here and they don't seem to compute 
> ticks with mach_absolute_time() (which in this case we want since we 
> want to compute in timer ticks instead of having to mess with ns / 
> cycle conversions). I do agree this patch does seem more complicated 
> on the surface though versus "just" setting cntvoff directly to some 
> value. Maybe we should simplify the QEMU_CLOCK_VIRTUAL implementation 
> first to maintain CNTVOFF_EL2/CNTV using mach_absolute_time() first?


So QEMU_CLOCK_VIRTUAL calls cpu_get_clock() which just adds an offset to 
gettimeofday(). This offset is already part of the live migration 
stream[1]. So if you just configure CNTVOFF_EL2 based on 
QEMU_CLOCK_VIRTUAL adjusted by the clock frequency on vcpu init, you 
should have everything you need. You can do that on every CPU init even, 
as the virtual clock will just be 0 on start.

The only thing we need to change then is to move the WFI from a direct 
call to mach_absolute_time() to also check the virtual clock instead. I 
would hope that gettimeofday() calls mach_absolute_time() in the 
background too to speed it up.


Alex


[1] 
https://git.qemu.org/?p=qemu.git;a=blob;f=softmmu/cpu-timers.c;h=1eb7c675c18bda7773d4a9c549f0157c6e978a83;hb=HEAD#l229


--------------8E81D7DC2B5F2A2D3B1F9CAE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02.12.20 23:46, Frank Yang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEkmjvV-XPmBCGsOnBhZ20t6D+vbp+7pOUpDeMJL3dKAjZvErQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Dec 2, 2020 at 2:28
            PM Alexander Graf &lt;<a href="mailto:agraf@csgraf.de"
              moz-do-not-send="true">agraf@csgraf.de</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <p><br>
              </p>
              <div>On 02.12.20 23:19, Frank Yang wrote:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr"><br>
                  <div>From downstream: <a
href="https://android-review.googlesource.com/c/platform/external/qemu/+/1515002"
                      target="_blank" moz-do-not-send="true">https://android-review.googlesource.com/c/platform/external/qemu/+/1515002</a><br>
                    <br>
                    Based on v3 of Alexander Graf's patches<br>
                    <br>
                    <a
                      href="https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de"
                      target="_blank" moz-do-not-send="true">https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de</a><br>
                    <br>
                    We need to adjust CNTVOFF_EL2 so that time doesnt
                    warp.  Even though we<br>
                    can set separate CNTVOFF_EL2 values per vCPU, it
                    just is not worth the<br>
                    require effort to do that accurately---with
                    individual values, even if<br>
                    they are a tiny bit off it can result in a lockup
                    due to inconsistent<br>
                    time differences between vCPUs. So just use a global
                    approximate value<br>
                    for now.<br>
                    <br>
                    Not tested in upstream yet, but Android emulator
                    snapshots work without<br>
                    time warp now.<br>
                    <br>
                    Signed-off-by: Lingfeng Yang &lt;<a
                      href="mailto:lfy@google.com" target="_blank"
                      moz-do-not-send="true">lfy@google.com</a>&gt;<br>
                  </div>
                </div>
              </blockquote>
              <p><br>
              </p>
              <p>If we just always make CNTV start at the same 0 as
                QEMU_CLOCK_VIRTUAL, we should be able to just recover
                the offset after migration by looking at
                QEMU_CLOCK_VIRTUAL to set CNTVOFF, right?<br>
                <br>
                That would end up much easier than this patch I hope.<br>
                <br>
                <br>
              </p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>The virtual clock interfaces/implementations in QEMU seem
            complex to me relative to the fix needed here and they don't
            seem to compute ticks with mach_absolute_time() (which in
            this case we want since we want to compute in timer ticks
            instead of having to mess with ns / cycle conversions). I do
            agree this patch does seem more complicated on the surface
            though versus "just" setting cntvoff directly to some value.
            Maybe we should simplify the QEMU_CLOCK_VIRTUAL
            implementation first to maintain CNTVOFF_EL2/CNTV using
            mach_absolute_time() first?</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>So QEMU_CLOCK_VIRTUAL calls cpu_get_clock() which just adds an
      offset to gettimeofday(). This offset is already part of the live
      migration stream[1]. So if you just configure CNTVOFF_EL2 based on
      QEMU_CLOCK_VIRTUAL adjusted by the clock frequency on vcpu init,
      you should have everything you need. You can do that on every CPU
      init even, as the virtual clock will just be 0 on start.<br>
      <br>
      The only thing we need to change then is to move the WFI from a
      direct call to mach_absolute_time() to also check the virtual
      clock instead. I would hope that gettimeofday() calls
      mach_absolute_time() in the background too to speed it up.<br>
      <br>
      <br>
      Alex</p>
    <p><br>
      [1]
<a class="moz-txt-link-freetext" href="https://git.qemu.org/?p=qemu.git;a=blob;f=softmmu/cpu-timers.c;h=1eb7c675c18bda7773d4a9c549f0157c6e978a83;hb=HEAD#l229">https://git.qemu.org/?p=qemu.git;a=blob;f=softmmu/cpu-timers.c;h=1eb7c675c18bda7773d4a9c549f0157c6e978a83;hb=HEAD#l229</a><br>
    </p>
  </body>
</html>

--------------8E81D7DC2B5F2A2D3B1F9CAE--

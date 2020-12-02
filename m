Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1561487lfb;
        Wed, 2 Dec 2020 14:28:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWeQhSycNtjPbWuo3pFerYKKZMIhMWz9kF6FPutYoyiWm9WMrsGqIljucF4EVJspRjv3J3
X-Received: by 2002:a25:1c57:: with SMTP id c84mr488926ybc.25.1606948129946;
        Wed, 02 Dec 2020 14:28:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606948129; cv=none;
        d=google.com; s=arc-20160816;
        b=opb1g6GGuJmpsJ4fEan+zt+w31RMw8rPC3OY+xHRHLj+9QDM8tRX6ES+JdF98Xvzp5
         sC+YsH8Jw9jYIkuqNHE15/nraiZdGumGwv+4jlpi9K9lL7cx3FY4y4fTDbfnoM74qXxp
         hp49NJ2i7TJhMuD5EtXmgTFmW1SmBI5ef3ih+SLd5cfcOW6dypNs1I+DerfISQ8Ei8+I
         0aTJlptpE0bj1OIhrVtg8PfbINVs7pJnlO29WO6syGH52U4Ouko7attFvQg0y+bvlC7+
         maxNE6j8ehMcuzouv5QUqbXeFwzbFFTFlqiC5zdlT1QUqtwUOIbK0llvy2Y7j/sBpUz3
         tdPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject;
        bh=qjIB6pbsUeQvCDRP8KdwGjUc1DsTHPW7gqvw+oZvHU8=;
        b=diPSR4j+lszcrk1jJ8GicU+/FZ42iheeTLJIh8RL1fAPoCgffsxp2awdzJvrDXj9+7
         4tGLLvhzg7c53Qbuko1/LiRNKwdoKtEU1jqQ1luP7qvs0hqw763OpdNMNE0uyTVpACzR
         7kD09GGd6JSf38RINsXGXnVNLqU932QGVRlJbWFMnqUxdTRDdBvHV3z/1Er/EZtDDBPb
         feVI95PF7P7wEBCH18FvpO5OdHiwFI8wg5a4t72dpkv8xJVCBQt2hrw7quhtC5YhQ1Wr
         VUExy3rWPB719XzDQ+nsd9TMFHSzKZhREFHVXkLP8ukF/pP0E6WqX+Y2pvU5Rj/XaUh8
         0org==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si22075ybb.27.2020.12.02.14.28.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 14:28:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkacD-0002ry-Bw
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 17:28:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkac0-0002rc-0r; Wed, 02 Dec 2020 17:28:36 -0500
Received: from mail.csgraf.de ([188.138.100.120]:38390
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkabv-0006IK-1D; Wed, 02 Dec 2020 17:28:35 -0500
Received: from freeip.amazon.com
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with ESMTPSA id 9C0A73900313;
 Wed,  2 Dec 2020 23:28:27 +0100 (CET)
Subject: Re: [PATCH v1 1/1] hvf: arm: Properly sync guest time on migration
To: Frank Yang <lfy@google.com>
References: <CAEkmjvXGccGs2QhaiLFupTDWcnp4O+qez-uj8QdbRG13UfCy2Q@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <2dc974cc-abe2-d034-1720-d5a2651a9042@csgraf.de>
Date: Wed, 2 Dec 2020 23:28:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAEkmjvXGccGs2QhaiLFupTDWcnp4O+qez-uj8QdbRG13UfCy2Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------B7153BB47DEFF0058044D14E"
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
X-TUID: PxJpb2VGROey

This is a multi-part message in MIME format.
--------------B7153BB47DEFF0058044D14E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 02.12.20 23:19, Frank Yang wrote:
>
> From downstream: 
> https://android-review.googlesource.com/c/platform/external/qemu/+/1515002 
> <https://android-review.googlesource.com/c/platform/external/qemu/+/1515002>
>
> Based on v3 of Alexander Graf's patches
>
> https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de 
> <https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de>
>
> We need to adjust CNTVOFF_EL2 so that time doesnt warp.  Even though we
> can set separate CNTVOFF_EL2 values per vCPU, it just is not worth the
> require effort to do that accurately---with individual values, even if
> they are a tiny bit off it can result in a lockup due to inconsistent
> time differences between vCPUs. So just use a global approximate value
> for now.
>
> Not tested in upstream yet, but Android emulator snapshots work without
> time warp now.
>
> Signed-off-by: Lingfeng Yang <lfy@google.com <mailto:lfy@google.com>>


If we just always make CNTV start at the same 0 as QEMU_CLOCK_VIRTUAL, 
we should be able to just recover the offset after migration by looking 
at QEMU_CLOCK_VIRTUAL to set CNTVOFF, right?

That would end up much easier than this patch I hope.


Alex



--------------B7153BB47DEFF0058044D14E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02.12.20 23:19, Frank Yang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEkmjvXGccGs2QhaiLFupTDWcnp4O+qez-uj8QdbRG13UfCy2Q@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr"><br>
        <div>From downstream: <a
href="https://android-review.googlesource.com/c/platform/external/qemu/+/1515002"
            moz-do-not-send="true">https://android-review.googlesource.com/c/platform/external/qemu/+/1515002</a><br>
          <br>
          Based on v3 of Alexander Graf's patches<br>
          <br>
          <a
            href="https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de"
            moz-do-not-send="true">https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de</a><br>
          <br>
          We need to adjust CNTVOFF_EL2 so that time doesnt warp.  Even
          though we<br>
          can set separate CNTVOFF_EL2 values per vCPU, it just is not
          worth the<br>
          require effort to do that accurately---with individual values,
          even if<br>
          they are a tiny bit off it can result in a lockup due to
          inconsistent<br>
          time differences between vCPUs. So just use a global
          approximate value<br>
          for now.<br>
          <br>
          Not tested in upstream yet, but Android emulator snapshots
          work without<br>
          time warp now.<br>
          <br>
          Signed-off-by: Lingfeng Yang &lt;<a
            href="mailto:lfy@google.com" moz-do-not-send="true">lfy@google.com</a>&gt;<br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>If we just always make CNTV start at the same 0 as
      QEMU_CLOCK_VIRTUAL, we should be able to just recover the offset
      after migration by looking at QEMU_CLOCK_VIRTUAL to set CNTVOFF,
      right?<br>
      <br>
      That would end up much easier than this patch I hope.<br>
      <br>
      <br>
      Alex<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------B7153BB47DEFF0058044D14E--

Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp181478lff;
        Mon, 9 Aug 2021 02:43:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzANKa7pakqTqexXcgzYDKDFzFeBKbj7Gk/NTuVmelxXJZQTioCiJMo7TzJmlLDmfEs+HLw
X-Received: by 2002:a02:2307:: with SMTP id u7mr21925048jau.28.1628502195128;
        Mon, 09 Aug 2021 02:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628502195; cv=none;
        d=google.com; s=arc-20160816;
        b=povT9MjVeUWif0iQ4WeZsorpxIstzL0fy553vno6MooJYPYYDwbVlzXRehQz4yt8w4
         yivF/H/WJSp1NZVW10eqwaMpO69B572HqtnC/6YB+I5nMaUMqZoGZiXi82iKcm24xO1w
         DmP+XDXulvO0xat92Jyx17ml1DkYBKSkxsYxRIT0geQk6VhNZs+nrku2FGRL2Jgvkw7o
         cn/5rFnUMgHv0wTnBK0066LUdZwYcIdFDV07JnacJC9fzPEIIljUloTLZfUqCbkEe5Re
         ulw1q7Ku/082godNEsseicgMLP74WQiTUcIl+OPQCwcYIcV4gMRlF5Wvr2BfTaPag/DQ
         Dt2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=phHGFTgZcZXvvM5+o9c+ifc0Qj+hb69JthB2fj1Y7wY=;
        b=xLHa/LzgaOM7Si7E2WppW0vGZiL6AnmRxuDRASqFDerdigr3+RYpL3RrKnUW/BrSnV
         giaLjDXr9OTKyG0WC+sHvy+UJnJUXgURDdN9wrJYFP3eZM6NitY4vN6sYf3bZJ81ngMx
         geO0o9ATmcEZRWpFDlYLin4O27oX8lSFY65ywilTtKGsx7NKQVBN5HDaV42bWvBEHVaS
         7lrKFQE2UDGuff2kQJtzUZ47VBGcjt7WVqD39ojsAr80cQ4Fu9/5/lNu3gS0DABeLpAo
         Jrhq7zVEUMs/deckNQlafb7wJ6IEZSMIalFNQ4JO7LeFB/+SEAecHupUDKVIxzYuPz+C
         Sxzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UAvfES6R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si16073970ill.152.2021.08.09.02.43.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Aug 2021 02:43:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UAvfES6R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mD1oQ-0002cU-D5
	for alex.bennee@linaro.org; Mon, 09 Aug 2021 05:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD1o9-0002cI-Hb
 for qemu-arm@nongnu.org; Mon, 09 Aug 2021 05:42:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD1o8-0006Lr-3Z
 for qemu-arm@nongnu.org; Mon, 09 Aug 2021 05:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628502175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phHGFTgZcZXvvM5+o9c+ifc0Qj+hb69JthB2fj1Y7wY=;
 b=UAvfES6RRqgyHp41O1Kq8r2V85zkyJybVLDOty398pYxFa8PyY72cN8sRTiknK56Ic2fAi
 uafbpEW/zgfcQuLbZYvFaWCSU4exyGrv39WvpsFz30bb49qN1Wr6m9LkVDdP44Kq1PMf3P
 5yfRQfR74onUrae7DwO7E2CFib5xvpc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-Rjs8Nh8dP-a4K9SI0PVM5w-1; Mon, 09 Aug 2021 05:42:54 -0400
X-MC-Unique: Rjs8Nh8dP-a4K9SI0PVM5w-1
Received: by mail-wm1-f71.google.com with SMTP id
 e21-20020a05600c4b95b029025b007a168dso6637835wmp.4
 for <qemu-arm@nongnu.org>; Mon, 09 Aug 2021 02:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=phHGFTgZcZXvvM5+o9c+ifc0Qj+hb69JthB2fj1Y7wY=;
 b=J6v8K5xPJhlmcac5Bd2MnRO5Bio1KGUhAQdY4diURoRgFUpJXWXExw+PpFRnCsKjPy
 OyJfrAaItO2vkGreCTjKYRQEX09C5qIuJjQubYENkWLEqWCvrl54Oujy0lEPciW0oLuM
 Grts3+S3vzM0SMs7zXgQTgJvP5utdhIpDj3m7ikRbylYMoXl/hA5ui7DdLkHaXXCVvGP
 aZgSDcOhIM00HbG+NpfyS0gyc2qnTIWFv96auR7lzvj+t8eYUhel1zoeQIOwcpaT5N+E
 0HnqHGd6yCyZAuIiM99TMj5eviDEA2UGdELs5awyiJ+WhwERVpGiQeQhFmaLYKr8g9AN
 SuPw==
X-Gm-Message-State: AOAM532RDtZJJ4rEZPxwDStu8ASus95+/kiznW0dHP+CuuRmAFLe41os
 FTkwJMiKIPppic68QjTG4zERfdtUW/PPzo1TjWa89FxUmtPrSrQFnB4fvCD81F/JYGBQy5+Tc0G
 7ButK0sjzsZuF
X-Received: by 2002:a7b:ce08:: with SMTP id m8mr33100227wmc.21.1628502173396; 
 Mon, 09 Aug 2021 02:42:53 -0700 (PDT)
X-Received: by 2002:a7b:ce08:: with SMTP id m8mr33100212wmc.21.1628502173238; 
 Mon, 09 Aug 2021 02:42:53 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id 129sm17119071wmz.26.2021.08.09.02.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 02:42:52 -0700 (PDT)
Subject: Re: [PATCH v2] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
To: Qiang Liu <cyruscyliu@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
 <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
 <CAFEAcA9Qn+PMGWRLtBdPXWpzz=JzoNc+XiaEpPXGv4Wb+YX3=A@mail.gmail.com>
 <CAAKa2j=zjGEEcfSz4fv=wOW6+OajXQp1Gy=VYjbH5QMrBXNHMg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cefaded8-e2cb-3a73-131c-01ad5505933c@redhat.com>
Date: Mon, 9 Aug 2021 11:42:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAAKa2j=zjGEEcfSz4fv=wOW6+OajXQp1Gy=VYjbH5QMrBXNHMg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yEZ3OZjUd/3p

On 8/9/21 11:33 AM, Qiang Liu wrote:
> Thank you for all the insightful comments about the separated patches.
> This would be my first time to format a serial of patches. Does it
> look like below?

> [PATCH v3 00/2] title
>      [PATCH v3 01/2] fix
>      [PATCH v3 02/2] test

Exactly. Otherwise, adding the test before the fix would
make an incremental build to fail.


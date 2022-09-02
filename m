Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp853927ejh;
        Fri, 2 Sep 2022 03:27:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6o8cvNnvZhxt+Va7qaLjpiDzfVu3xXFbuO+KwNJufuJBwTYjD5bF5SMdmKmbIBHoUaV//g
X-Received: by 2002:a05:620a:2b91:b0:6bb:2f73:a0bc with SMTP id dz17-20020a05620a2b9100b006bb2f73a0bcmr23048708qkb.438.1662114463567;
        Fri, 02 Sep 2022 03:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662114463; cv=none;
        d=google.com; s=arc-20160816;
        b=0QEo++W+7vkshqFyOKuIVQt3pPyTvAV3Ygg6CkYM5aLo1NwKZBpT+HpsSbrZ0hQ/eJ
         RrgF5uoDbnbiVZEy0VcOqt5K98lpDAtHmbbzkh3aQXQiv46zgpmfCaGiQ+h5ExxJOLq7
         dy0AWik34fSECUTZ1NNrBgD+zYKocbowRa4w+Qny0pocqvhBGDTPmsGMVqT1KwL/Sim+
         muj/Yy5CV1bNO3Aw/wC/AxWqsKvt8+JCxbhsgDl9aixKHJ4gylrrVPrtI+R52dqifPCr
         BtJpwcmz8kFQlPLJiEXqqTcynuPE5qWUoWOwadPdJVh0alV6ljgF44Bm8EdG62bFB8NK
         1euA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=XxRD8cUnMc/rjICQkhZMejnNXvJP9mYKdj/L6cL3IdQ=;
        b=HIT1tHL71HGbgKf7cvOlC2+/Q5zw+hVrbnYqkxZg0kcN6W32TcLLbiYR/xIp9cO/mz
         kHktQ8gTecCt8g9RE1I9zjXtgoaV3OUI/T9W/Qg9VHok0+FQxtpujDpmYn2uHO68uc0o
         DhPu/NhFAe1idI7t+jlxl6MkQgthigdI4nvgklnnFUyQ90FgxcRM/xSkHdLCKJ4dLQIe
         99p2ocDSNpjC50Y9T0FMBw4nn3CFGhSX6UlEfMxZP9gGj2U4ZnVFdE2DVz4/1jBAqRN1
         Za8s42Vi9IZ9q3ahfHhLPRokhnUT6VUr6twBeMG8No+i3rIh6nlLXWgChqZM7AO0K1Co
         R9qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WiecHLwE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cc23-20020a05622a411700b00344591bce89si900951qtb.335.2022.09.02.03.27.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Sep 2022 03:27:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WiecHLwE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oU3tf-0008J6-Oq
	for alex.bennee@linaro.org; Fri, 02 Sep 2022 06:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oU3pz-0007Mj-1w
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 06:23:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oU3ps-0005ZT-Fz
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 06:23:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662114219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XxRD8cUnMc/rjICQkhZMejnNXvJP9mYKdj/L6cL3IdQ=;
 b=WiecHLwE5JrAaC1lQQPfQoazlzdU2dJ5/LFsIuB6s2ppUdRKCB6esyLnuau6iUDQ1ywmJa
 2pFK0WxlG+A4irboyBuuuTf6Ca+kB7eIfoXVuGElW4TyX4ofUX//ks1cHwyOQEZOnR2WCd
 hE8Xjig5merH6/fj/IP+d4UcJqEQ5zY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631--grwWpJWN3-npkaAQBiiQQ-1; Fri, 02 Sep 2022 06:23:36 -0400
X-MC-Unique: -grwWpJWN3-npkaAQBiiQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 477208037B7;
 Fri,  2 Sep 2022 10:23:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 964A840D282E;
 Fri,  2 Sep 2022 10:23:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 461D621E6900; Fri,  2 Sep 2022 12:23:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  qemu-arm@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,  Eduardo Habkost
 <eduardo@habkost.net>,  John Snow <jsnow@redhat.com>,  Dmitry Fleytman
 <dmitry.fleytman@gmail.com>,  Jason Wang <jasowang@redhat.com>,  Stefan
 Weil <sw@weilnetz.de>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Peter Maydell <peter.maydell@linaro.org>,  Andrey
 Smirnov <andrew.smirnov@gmail.com>,  Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: Re: [PATCH v2] pci: Assert that capabilities never overlap
References: <20220831013236.32937-1-akihiko.odaki@daynix.com>
Date: Fri, 02 Sep 2022 12:23:33 +0200
In-Reply-To: <20220831013236.32937-1-akihiko.odaki@daynix.com> (Akihiko
 Odaki's message of "Wed, 31 Aug 2022 10:32:36 +0900")
Message-ID: <87tu5qulay.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cEubbC+JblwC

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> pci_add_capability appears most PCI devices. Its error handling required
> lots of code, and led to inconsistent behaviors such as:
> - passing error_abort
> - passing error_fatal
> - asserting the returned value
> - propagating the error to the caller
> - skipping the rest of the function
> - just ignoring
>
> The code generating errors in pci_add_capability had a comment which
> says:
>> Verify that capabilities don't overlap.  Note: device assignment
>> depends on this check to verify that the device is not broken.
>> Should never trigger for emulated devices, but it's helpful for
>> debugging these.
>
> Indeed vfio has some code that passes capability offsets and sizes from
> a physical device, but it explicitly pays attention so that the
> capabilities never overlap.

I can't see that at a glance.  Can you give me a clue?

>                             Therefore, we can always assert that
> capabilities never overlap when pci_add_capability is called, resolving
> these inconsistencies.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>


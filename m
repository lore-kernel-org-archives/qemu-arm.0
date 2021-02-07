Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp589412lfc;
        Sun, 7 Feb 2021 10:43:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoweWYcmR9lSUWW4aaOV9g89nvoySLi1/J9Eiwp/SkAyQyfTJ20FIthQv9g/e9KXIfV638
X-Received: by 2002:a5b:111:: with SMTP id 17mr20165365ybx.324.1612723435867;
        Sun, 07 Feb 2021 10:43:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612723435; cv=none;
        d=google.com; s=arc-20160816;
        b=GwdhvwyoC/AlCf0Z/Rx2Kj7MbcQPr4q7C0mkPgmKuZIvug9EYaU+XxVXVoZDtsFj68
         VihW1XBEZAnrX98x4BbSL8+FXDnOllFoqzYjqRJqezfbZdJUkSeBh4aOpqHFLyeL9Zeo
         TC2fVMKHvc39kJGHYlIOgc7MNYLLxJVzCftmUev/lGC2ufyLftlQOGPJT3zvaJL6xBV+
         VhW0a/7aaB6dOcxWuzO7MrLchREwBtqxylFCT8SgXyDLAGSGMjKE/d/if3m984xOZvHR
         4vXK+JOkQjxikx7WkRmtu2l+fwhV/N/kljawtqx8S6wILr7kn+zVDsQPsuKvgzFx+26R
         4eUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=/DlRknGDm8ztpJbw/VJVI857aGO9KwH1Q+65xG4ueUM=;
        b=KvOocNfezYrsoEv81AK0pkTbkC8mtbBMZBFZ7OkGWtavB+6aOaWwrEdBe2qWqoo2z0
         +RUqAvJm8qJDWXumyZDLchvpvdyaAJGu2SZ4UOd8MLxiNGzpQT+OaWg4dxmK2N9re958
         iwOp5nh6BzBO3zegPCi6aFRhU3/Ignf3nV6b0lVLh6JBMKdxITJ5DhQEnge/f+CYQROL
         E935xT8+z4LR0rWlAyFJASCkdZlsasO/lmZxvUf12c4mwwMWHkANKe44Zw7+zMcpfMkL
         r8HVA91E7BlE4vS9beaCkDQw5QDpUVYR2bA+3T1FwOfO4IsdvcJg7EM8HVRHe62yRyWz
         lxpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="cxQfjA/C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v137si12013145ybe.342.2021.02.07.10.43.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Feb 2021 10:43:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="cxQfjA/C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8p2J-00038h-8W
	for alex.bennee@linaro.org; Sun, 07 Feb 2021 13:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l8p1h-00033e-Og
 for qemu-arm@nongnu.org; Sun, 07 Feb 2021 13:43:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l8p1d-0004Hq-R2
 for qemu-arm@nongnu.org; Sun, 07 Feb 2021 13:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612723389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/DlRknGDm8ztpJbw/VJVI857aGO9KwH1Q+65xG4ueUM=;
 b=cxQfjA/CP0VQ1RNwkCC7Nelld/tSUewMkseuW2+eq1wn5juI3XIbINuwD7qlHAhbsDZh5o
 XzHCmdkUzHQx5tIn1dzVM2d2KLkKLU8NP+PqCCN5HGt9iRLWHQV2jm2IJGojuuKbkCR6Dh
 E/coQvvR4I5c0OCNTMrVO6YaR2SALoE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-i5B2pHsDMQWKB03nBEtd2Q-1; Sun, 07 Feb 2021 13:43:07 -0500
X-MC-Unique: i5B2pHsDMQWKB03nBEtd2Q-1
Received: by mail-wr1-f70.google.com with SMTP id c1so11495843wrx.2
 for <qemu-arm@nongnu.org>; Sun, 07 Feb 2021 10:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/DlRknGDm8ztpJbw/VJVI857aGO9KwH1Q+65xG4ueUM=;
 b=lL608abZxXgWNKzpHWqMaTL4onTdNonhhd7s4aOYi/ndg5PAeRX98fHCus7KHPeYZR
 /3HMF/G0kqvQpk2kIXu01Aos5ahUdv8/tAS3vWPto88KOHO15r/GFdtuUDdfQnRrery/
 lcGeNtjESiwFBeG97bcjzDdl5/P6wSaS+9ThU90Ud1ekSm6mf6coQsiKctsJPu5EU4C0
 tzmz0KuH0+Nkp01Jh9mhseYJH/P79NWN4hKN1baAKfck77rRjMo8TNWJX4slcTdfahCt
 VdeoysDyLRgP2jaEmNHCnyqgRKk7zRDJ9tAX9H+qJpD7UCEuVrm5tPf3uLRbIIFznoTQ
 t0PQ==
X-Gm-Message-State: AOAM532SQvPxd001mHwzCnBpdz3ooXA4gMzPTWIQL31DTi/PKa0L1PJ9
 /tob0glb/fwuFyl/XajWkezzmxl/HzdHQoMoKMc8Cj2JlxzY3/SvHMrKcSWTazsHMD3TiC/kFXG
 eJkYOK8K56x80
X-Received: by 2002:a05:6000:1542:: with SMTP id
 2mr16360280wry.356.1612723386484; 
 Sun, 07 Feb 2021 10:43:06 -0800 (PST)
X-Received: by 2002:a05:6000:1542:: with SMTP id
 2mr16360263wry.356.1612723386320; 
 Sun, 07 Feb 2021 10:43:06 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id b13sm22525604wrt.31.2021.02.07.10.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 10:43:05 -0800 (PST)
Date: Sun, 7 Feb 2021 13:43:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marian Postevca <posteuca@mutex.one>
Subject: Re: [PATCH v4 2/5] acpi: Permit OEM ID and OEM table ID fields to be
 changed
Message-ID: <20210207134214-mutt-send-email-mst@kernel.org>
References: <20210119003216.17637-1-posteuca@mutex.one>
 <20210119003216.17637-3-posteuca@mutex.one>
 <20210205082049-mutt-send-email-mst@kernel.org>
 <87h7mnzqhm.fsf@mutex.one>
MIME-Version: 1.0
In-Reply-To: <87h7mnzqhm.fsf@mutex.one>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VyTcV4mW/cXG

On Sun, Feb 07, 2021 at 08:23:33PM +0200, Marian Postevca wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> >
> >
> > I queued this but there's a lot of code duplication with this.
> > Further, the use of g_strdup adds unnecessary dynamic memory
> > management where it's not needed.
> > I'd prefer
> > -   a new struct AcpiBuildOem including the correct strings
> > -   use sizeof of fields in above instead of 8/6
> > -   move shared strings and code into a common header
> >
> 
> So how should I approach this since the patches are queued? A new patch
> with the suggested changes, or resending the original patches?

A patch on top please. They are merged so really easy, just basing on
masted should be good.

-- 
MST


Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp378853lfy;
        Fri, 24 Jul 2020 07:14:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdOoodAj3W5E8P88pWxqLUEs76x45ZXKIgroTHsgmLL0NfWG2Y4OX76UYy6EnC5MQn6yMH
X-Received: by 2002:a25:d451:: with SMTP id m78mr15142481ybf.156.1595600084922;
        Fri, 24 Jul 2020 07:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595600084; cv=none;
        d=google.com; s=arc-20160816;
        b=QwOfpbFe89uRXkJZ/SpTSPgeCMml/CsjEwbY+bu/5gnx9QJ8Kpuj7yVyhalNmPM8rY
         OfIudmNLRycFT3g+iLVCP9vJGqVTLl+NyIUDimNNIF8MK2VeB0yScONO+314uV6NbmRd
         xF2Euf5gHXGX2UeuPp4jXSmLGj84SqvupL8r61BBMl/qXobFSfZdD0myJdtuzJeE7ggL
         PL7V20RI8VaOfH8VYf6hxTZD1FSjTGjgPT2QsKRwt2L/vpSuyXzGyUyWGh+m7HI06WFj
         K5SW33T3bFVwCC8V0YB4YVmTbdJZEhPytK1Vf32FEdUOUfj/RchT5vyu4bZow/UZtznG
         fvEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Nso84JT+63tIjcqjk4a138RNIooynsIS05BmGsTfYfg=;
        b=z2Dz3crujT9kSVCUSJvGBe91j7/CifyYbSpyPl3PKAQYiDXbkbwOzoa2uQEYIenfKY
         degJoS2n3M3fJlFDZZiX1uPUddmp5lyb+TH4SICu1wf7hTLFRlOhFuDt8M5n8ozBJzT2
         y0Hjhj7naZ0+s8SCB8IcAoA5OPqJFsmuSiASU+bhFZgoMmDmiXfiNzAe9ggZTF7/Xm3B
         l6q9xV9rnvPKg6rvlYMB+8Ow97Lynor5oYFJxzh9bEk0+nkehSCUs6orN3O/UkvmWSji
         WFG/cR9D8CVdFHFHPh/S9sdseyY/Q2Lgp13TlLRgDC3aEuaF+t5rfUclod4tsZqeMGUn
         FtCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Su/fJH6X";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si1063549ybo.350.2020.07.24.07.14.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 07:14:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Su/fJH6X";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jyyTE-0007Ab-Ag
	for alex.bennee@linaro.org; Fri, 24 Jul 2020 10:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jyyT7-00079V-0C
 for qemu-arm@nongnu.org; Fri, 24 Jul 2020 10:14:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40426
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jyyT5-0001q5-K2
 for qemu-arm@nongnu.org; Fri, 24 Jul 2020 10:14:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595600074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nso84JT+63tIjcqjk4a138RNIooynsIS05BmGsTfYfg=;
 b=Su/fJH6XUDqyGKc0Uo3S9O+IK+J8WhufIDIbPpwoJj8xRhyuHR3x4+TCsyHiCF3z/u5vo0
 CSfl/+mqzuJLewamh1P9aNnBwgKj86/Bi7HT+VgX/UXdBvoLNYIgOWqCSKcGOCJSfPhbQC
 ac3h+6mmCrmGCeemasK5fx3RIwyi/V4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-N_aWCYz9MAC9mOTvslWWyg-1; Fri, 24 Jul 2020 10:14:30 -0400
X-MC-Unique: N_aWCYz9MAC9mOTvslWWyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E4F08014D4;
 Fri, 24 Jul 2020 14:14:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A53B1002391;
 Fri, 24 Jul 2020 14:14:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E0ABF17444; Fri, 24 Jul 2020 16:14:26 +0200 (CEST)
Date: Fri, 24 Jul 2020 16:14:26 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paul Zimmerman <pauldzim@gmail.com>
Subject: Re: [PATCH for-5.1] hw: Only compile the usb-dwc2 controller if it
 is really needed
Message-ID: <20200724141426.6fn26pa2c3735zo3@sirius.home.kraxel.org>
References: <20200722154719.10130-1-thuth@redhat.com>
 <d77052d1-6203-d54a-0c36-edfafaa34922@amsat.org>
 <1aa53dfa-92a0-3866-2117-a7ce450d278f@redhat.com>
 <CADBGO79TMy+-hM3qUKBrE5U9OY6Pq+2LVe6iozDTzrWFYVhQoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADBGO79TMy+-hM3qUKBrE5U9OY6Pq+2LVe6iozDTzrWFYVhQoQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 08:55:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gVqlXE7x1l9X

On Wed, Jul 22, 2020 at 09:36:27PM -0700, Paul Zimmerman wrote:
> Gerd, it's OK by me if you take Thomas's patch instead, I agree the
> changelog is better. It also has a fixes tag.
> 
> Reviewed-by: Paul Zimmerman <pauldzim@gmail.com>

Queued.  Thanks,
  Gerd


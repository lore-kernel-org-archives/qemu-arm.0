Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp485630lfc;
        Thu, 3 Sep 2020 05:26:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpOmEwiQ7lE9EjOw7pvNi/uymVWkj+1QyAcGpf+ny8SuY4j21Oc+vD+ndubewqHWflFUV9
X-Received: by 2002:a25:1fd5:: with SMTP id f204mr2488317ybf.236.1599136012454;
        Thu, 03 Sep 2020 05:26:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599136012; cv=none;
        d=google.com; s=arc-20160816;
        b=dkMtLZXkBZPYmwFLeuO7492lfllTb1NkxtlxlqgvNM5+9U4TxalhYGXlhOyalQki3k
         tSnxt0npboMIU893lfUwetoTxx+N8hvSndAuzVDJ2nglzIr7uNCPFBNayswJRYQoy2pY
         OFRVOljEBkHSKqeRdUE1n3AYouvna8fBgXHJ6EZx+3mS83CHn7jE+AwEgx+IAErUJPkl
         fmheQU/WtozkAEzlL2IjE7yV9Sgd8E5QTiOuoabcEFTFniRee6L5LjSfbPTNZnigYorR
         vXnqUOaCeRfa/En5QW+8+i6rRewNKncDsm4GosX36ZRWK6LR9Ux799iFzwkxNcviJQmp
         jWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UomRoFy3iVqdBdFlSJivlh63ysnacNH4u5rhTJV7rTI=;
        b=k7hwFww4ywoc4sr4+/lrU1ZRgv3Ey7Rtq27c0Q9Lrm7IjlcGyPb1AJEQiEzahEyIGf
         eHJzb8UW10KCMtbJT6pTpfAftEvrXLVh/007WjVAifj7nUXne/vmqJoLq/MsaMILFAVq
         AsiGlH0HLgg6uaoEV0Wku0sTwys5/AxdXkvoXdlWwun/TdUrgbNs+U6lWaIe+eql/CqO
         WR+0pbol40ry1cozZmlIFf5nO5yJitnSxib2v3MHa12rRRiC09Ydt2P3XkeOV0ONk0tU
         c4VrnfKPWEEXeJc7vc974yCVnOYA5qCqSt3/67/b7ok6l6pjv3dpjVgGLHVjO4q7gQDu
         zMcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JHR8RlO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v185si2825262ybv.256.2020.09.03.05.26.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 05:26:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JHR8RlO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDoKJ-0005hR-QE
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 08:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDoKA-0005gM-SQ
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 08:26:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54363
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDoK8-0007ew-3v
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 08:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599135999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UomRoFy3iVqdBdFlSJivlh63ysnacNH4u5rhTJV7rTI=;
 b=JHR8RlO9KtfOA5vxip9vW0HRX1AnbWvMGz3jZuBR2LB66tIOFemoYBDKMNuKVLeLD/ePJv
 yj6eqTucL5mh+xily25VZVrTRmj/vAZhM/3CaxrPWQg8G5NTlb+UyBNbGeY/Mvs2adWaJ3
 3PbDTD71P6F8j73YYYHxnc8hShHFF+8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281--WA3fhq6PjKt-AhwkNhzag-1; Thu, 03 Sep 2020 08:26:38 -0400
X-MC-Unique: -WA3fhq6PjKt-AhwkNhzag-1
Received: by mail-wr1-f69.google.com with SMTP id l17so1014272wrw.11
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 05:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UomRoFy3iVqdBdFlSJivlh63ysnacNH4u5rhTJV7rTI=;
 b=AyX8ojd7Ip/UsEoLizmI0SmkX6YUWJ/e3z3iNX4y1f0D0U7A6m4GQMrDlYYLqockcE
 tVCnJh+DJ+vJuaTn9vguMuGz8gnjExbDRH34Sh8KXcnVMjWmZqS1b1dyr/nblZRNt2RL
 1mZEiVf09IWchpk3Y5s1DX5t+7w0mmKZjDuwKYAmDfThCTM87xPjjgqKDXF1UpMCQb30
 iCm+4UaK8erdLbAH/XAe16t4PHVrVAg++X1Pbe33pwWT7WGfYoXrcPzQ6eSYtuNQAe8u
 +4MKSBKJiLrmogTbcf5qiI+xvEyOXftXcAN5qos4+babSn18GSA18dazjdczrqNAjbX+
 8gEg==
X-Gm-Message-State: AOAM530QEAmmcL3y72+OqD8dWXUrJczFt5wNTvOtAJeRrm2EFPHraQR8
 g34dym9T0DF7co5UkLfTrtTdHLA1cJ6TrKitB9v3JN0GZTyV+sHSVyPyJ1nVFB+ZVp3m08VUqgi
 GHx2rFOB3NkmM
X-Received: by 2002:a7b:c14d:: with SMTP id z13mr2246914wmi.107.1599135996854; 
 Thu, 03 Sep 2020 05:26:36 -0700 (PDT)
X-Received: by 2002:a7b:c14d:: with SMTP id z13mr2246854wmi.107.1599135996555; 
 Thu, 03 Sep 2020 05:26:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:197c:daa0:48d1:20b2?
 ([2001:b07:6468:f312:197c:daa0:48d1:20b2])
 by smtp.gmail.com with ESMTPSA id l15sm4344741wrt.81.2020.09.03.05.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 05:26:35 -0700 (PDT)
Subject: Re: [RFC PATCH 11/12] hw/pci: Only allow PCI slave devices to write
 to direct memory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200903110831.353476-1-philmd@redhat.com>
 <20200903110831.353476-12-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7e4fd726-07e9-dc09-d66b-5692dd51820f@redhat.com>
Date: Thu, 3 Sep 2020 14:26:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200903110831.353476-12-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:24:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.403, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, "Emilio G . Cota" <cota@braap.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Laszlo Ersek <lersek@redhat.com>,
 Robert Foley <robert.foley@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Tony Nguyen <tony.nguyen@bt.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Alexander Bulekov <alxndr@bu.edu>,
 Andrew Jeffery <andrew@aj.id.au>, Klaus Jensen <k.jensen@samsung.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3poQCT4Vwrg2

On 03/09/20 13:08, Philippe Mathieu-Daudé wrote:
> Do not allow PCI slaves to write to indirect memory
> regions such MMIO.
> 
> This fixes LP#1886362 and LP#1888606.

What is a "PCI slave"?  Which devices would still be allowed to write?

I'm worried that there are cases of MMIO reads that would be broken.
They are certainly niche these days, but they should still work; the
most "famous" one is perhaps the old BASIC

   DEF SEG=&HB800
   BLOAD "picture.pic", 0

Paolo


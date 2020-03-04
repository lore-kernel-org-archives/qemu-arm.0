Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp1667185lfi;
        Wed, 4 Mar 2020 06:19:27 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsSZuKlO9dJd3IKzryJJnEZ9LGjCZt6KGvznQGgRYs4tqPOziZIou+2AEiXDPl7OnM/aObi
X-Received: by 2002:a37:e10f:: with SMTP id c15mr3032381qkm.262.1583331567285;
        Wed, 04 Mar 2020 06:19:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583331567; cv=none;
        d=google.com; s=arc-20160816;
        b=uBo7oQcISjxdlYo8MNo58SgJMflTgrCN3olOu+rbnDeECtUG7WMdEvbCYWyPKY4GdB
         OWrT5oO2HkcG+nF+8GYOmYVdWtckRsesWK6E9/C1Ud69+Pn2yQPYAurIeBZNHNU5Le2m
         +VXZAoGWlZ+mK1e/3CcrdhxBc3K7HanRHsCUTelEdVRv42b6d52/pnCNTvi1UN/c4e3B
         7fGk7x5VhVIFtsJPOyQI1NJTYLrlBoYFkdEjxf3FMbiFgelZWLkIbk6p/pN7Ok2YY59T
         0DP11PTFQR7UXJxoaf/yS+JD/wpbwAuN3MdfH+wq/DYg7xcpEtKyu1qeK10FmUyEDX9x
         9jmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WNvxBkc+0sLn/M93sJq0r8WECREa81du/QTpzjZXEt8=;
        b=xhWvfVbdVPEHQAaYDWkRO0WBq/hvPdgv2UHe+FtvekLbYwjDIxrAAH7KcCqscTujri
         BFgFTdScMJM36RPP6zYvhkV6kFcuio995JFjOCdU9rO7KNqfTkD8GU1qgaHSZJnkibyK
         qcaXRSj40WTsKqCmPHupLx2rotUIrOZNKlEiBIgEpRr1gymJ6WN1WOjt5acLKj7ID/vM
         cj8jwyEoffw32qf4pOkJ+ktv18u+l/1zVjsvagdfEOtNMvuiwZ3I+w/dVpp6QUQDr5QS
         qmQkoeHK9IJ1PkDVP8ILD6K3f9sRN7iFVoRL3p8S/76mEteBkpKojYBKfqa6mDXsyd/H
         zq/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mx5wbmJu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si909691qkh.213.2020.03.04.06.19.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Mar 2020 06:19:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mx5wbmJu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9Uru-0008Vr-Hd
	for alex.bennee@linaro.org; Wed, 04 Mar 2020 09:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53774)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j9Urj-0008SG-3n
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 09:19:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j9Urh-0000Y2-Uc
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 09:19:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55112
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j9Urh-0000Xi-Rs
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 09:19:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583331553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WNvxBkc+0sLn/M93sJq0r8WECREa81du/QTpzjZXEt8=;
 b=Mx5wbmJuzJ5pn7iuYPO+0jnU9i9NWZHP99oT9XiEgV2k3ypbfBGNilyHvZgzO8JpekB7+Q
 McQBMWUw12FPuPojBt7x7RBOb6cP7wcpcWRUiGIt44eeVliYpBf//Yfh1ynDOe7uN0i6a2
 Z8ATrvsbi+GJovy7PlOFianG7YEx3u0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-CjqK7OndOSCaJFIExKHC1Q-1; Wed, 04 Mar 2020 09:19:09 -0500
X-MC-Unique: CjqK7OndOSCaJFIExKHC1Q-1
Received: by mail-wr1-f71.google.com with SMTP id l15so399296wrr.21
 for <qemu-arm@nongnu.org>; Wed, 04 Mar 2020 06:19:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=18OMrVfu00BGHTajXs/3slGyD4i/96bG2uMqkT7G3sA=;
 b=i6/nD5jO/S15lNRfWexrgWWuv0wHbbpMeDwvPXzgIpJ1HCY+5KbtFXaOt57BFNfvsy
 CA3bPX//PofrNbvF4fopM85O6Y1IDJjJ+GRn1Fy1hGNut4XvMUYnJIMNwYxek9UgOK4m
 UbNjyi00SeOUauHzzSfXLxX+gr7Xw3tp69FgcfeYJNZUoWHMOwQE7zNYpCwF1whFP36c
 hnZ6i+8L36oI79uz8Q0+4/OWtIIYgSSNbgIgR/wT+atZPctmHBPjmLOZZ+oqfygen2Ek
 cxfREurxWzqOOmXEbvr9Qcbk4tZN/p6HJGFJ4QyhU1ZSRglglIOC1HgJ4IQQB4VY1EaH
 nOmA==
X-Gm-Message-State: ANhLgQ2Y9w69w7oSV7MkMhjzY3b75FFOe+JbzHxHOqE3sCkortDtEjDb
 iVuY+zG/P+SIFY1N4mhKkR0gesaS70bGUuxGROuw2MQ4dN8a/SEI+uyDFSaPeoNAXnQpGjHEQkP
 eEJ9VHtH6zx/4
X-Received: by 2002:adf:ed42:: with SMTP id u2mr4446978wro.345.1583331548695; 
 Wed, 04 Mar 2020 06:19:08 -0800 (PST)
X-Received: by 2002:adf:ed42:: with SMTP id u2mr4446930wro.345.1583331548416; 
 Wed, 04 Mar 2020 06:19:08 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:9def:34a0:b68d:9993?
 ([2001:b07:6468:f312:9def:34a0:b68d:9993])
 by smtp.gmail.com with ESMTPSA id o3sm5426191wme.36.2020.03.04.06.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 06:19:07 -0800 (PST)
Subject: Re: [PATCH 1/2] misc: Replace zero-length arrays with flexible array
 member (automatic)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200304005105.27454-1-philmd@redhat.com>
 <20200304005105.27454-2-philmd@redhat.com>
 <1e1a1491-15ca-29d4-8bd6-1bf14edb4ad5@redhat.com>
 <38b55649-b1cd-8891-5c13-ec4c6ef3ae5e@redhat.com>
 <f1d4241c-e82e-53db-cc33-898890a0b070@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f10c129e-bef2-67ab-2aff-d3c9bda14b82@redhat.com>
Date: Wed, 4 Mar 2020 15:19:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f1d4241c-e82e-53db-cc33-898890a0b070@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: txMkBx6GWl4S

On 04/03/20 15:12, Philippe Mathieu-Daud=C3=A9 wrote:
> I'll send a fix for the dangerous code.
> Do you want to drop this series, or only the change in 'struct srp_rsp'
> (or in all hw/scsi/srp.h). Actually I guess it makes sense I move the
> 'hw/scsi/srp.h' changes with the series cleaning dangerous code.

As you prefer, it's not urgent to merge it.

Paolo


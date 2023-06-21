Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp842011ejt;
        Wed, 21 Jun 2023 06:23:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Ic83BA3zrRHQaIM0gXPC0dmP+1pMGcY/j9VrW8Ackd8shtTNwCMROEaYHXIZLdBteN2Ij
X-Received: by 2002:a05:6214:2484:b0:62f:ff5c:6b3e with SMTP id gi4-20020a056214248400b0062fff5c6b3emr7362035qvb.34.1687353822229;
        Wed, 21 Jun 2023 06:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687353822; cv=none;
        d=google.com; s=arc-20160816;
        b=ZGVzGwrgxtWBqtGCAYBY5qwiQi47aI9+1HOap4TB9LvO2D59Sw4PyOaWuU5bqdg/MF
         2aL5cqN/5DDGEWy0qWBqmR6bkhZDBO1qINXfqy7rKi6Ijv5NyndVSBcNu2Pd7tgVYhc2
         N4bztcOYn78dnOJKLO49+0ESS1kQShhfZ6+kKZZoVOTYtuZ2ntznWo+MEdTRR16H6gwl
         bQDlSbOOzlW84n+breDciDAgRXHRgVZZ3GgS6tux3d+pAiOtl1QS+ZtVbQnu2gFNzTnL
         oZinBxedPuDtVlOWADI1rQv0U7vKHc+WE+IsqrY3HuTMfQfwHGl/zZKZem60b4CGxXwL
         TqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:content-transfer-encoding:precedence
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ERsrI78muX1TaUJWyNwRoijK+KQffICasgLvQ5YDB64=;
        b=o3Ia7LQ/Y6yFO1gkA8nR82550MbadH9yGvJCBnnooACYNA2bmx79b2iTShK95tD8fQ
         PSa2vLNBbwl+FDUc0582w2yw/1NSkLz0c+aFrcyB9v538GEYNb0D7o1G7y8qvceQ9/d7
         rmLUq6LwE11LtJGHBZUBgNi+iHwiYZ3Kwia+UtUfu5BNdk9ZVrIGQ9ck6DfkJAz2AjVA
         diM+uYmBBI+NgHKBh6eiDafhdwXEe7QZ8M49YdO3QvCtBmf9hIW+xA17fDAJ+o8/EIfT
         nVJTG37RSnzFcn4Xiw3NUdnI60o9H96RU8Q2bJdV8KCT86jDnfavjne6tCB9MXwmzifP
         krPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=fw8S3gx2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a0562140cc300b0063217340105si292521qvx.536.2023.06.21.06.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jun 2023 06:23:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=fw8S3gx2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBxo1-0006nj-JJ; Wed, 21 Jun 2023 09:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=5293a3739=graf@amazon.de>)
 id 1qBxo0-0006l8-8g; Wed, 21 Jun 2023 09:23:28 -0400
Received: from smtp-fw-9103.amazon.com ([207.171.188.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=5293a3739=graf@amazon.de>)
 id 1qBxnu-00062A-Vf; Wed, 21 Jun 2023 09:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1687353802; x=1718889802;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ERsrI78muX1TaUJWyNwRoijK+KQffICasgLvQ5YDB64=;
 b=fw8S3gx2JUlFfilPmbMkuXYesL3D5gCZPnkbJJSB1mGXA2TE9rytEwkp
 HBOZ4aXmn+cC07POY4rMivXy5ec6/GNG4tJ8/YAp1/tGqv6AWjaaEQjzy
 1EX98q97LK+bueg+Uau+8QPYYRFXODWsNpzXOFmlKEGVUqkcOMJv1DaAL Q=;
X-IronPort-AV: E=Sophos;i="6.00,260,1681171200"; d="scan'208";a="1138801088"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-366646a6.us-east-1.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-9103.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 13:23:13 +0000
Received: from EX19MTAUWA002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1a-m6i4x-366646a6.us-east-1.amazon.com (Postfix)
 with ESMTPS id 870B0A0E97; Wed, 21 Jun 2023 13:23:12 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 21 Jun 2023 13:23:06 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 21 Jun
 2023 13:23:03 +0000
Message-ID: <4e04c702-6cea-ac2c-dde0-d630291ef0ff@amazon.com>
Date: Wed, 21 Jun 2023 15:23:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 00/12] Introduce new vmapple machine type
Content-Language: en-US
To: Mads Ynddal <mads@ynddal.dk>
CC: <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>, "open list:ARM cores"
 <qemu-arm@nongnu.org>, Cameron Esfahani <dirty@apple.com>, Roman Bolshakov
 <r.bolshakov@yadro.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230614224038.86148-1-graf@amazon.com>
 <ACE1A94A-4CB8-4B23-B09A-D2B1685E402E@ynddal.dk>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <ACE1A94A-4CB8-4B23-B09A-D2B1685E402E@ynddal.dk>
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D046UWA004.ant.amazon.com (10.13.139.76) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.171.188.200;
 envelope-from=prvs=5293a3739=graf@amazon.de; helo=smtp-fw-9103.amazon.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Sa89LRrfZrEk

SGkgTWFkcywKCgpPbiAyMC4wNi4yMyAxMzoxNywgTWFkcyBZbmRkYWwgd3JvdGU6Cgo+Cj4+IE9u
IDE1IEp1biAyMDIzLCBhdCAwMC40MCwgQWxleGFuZGVyIEdyYWYgPGdyYWZAYW1hem9uLmNvbT4g
d3JvdGU6Cj4+Cj4+IFRoaXMgcGF0Y2ggc2V0IGludHJvZHVjZXMgYSBuZXcgQVJNIGFuZCBIVkYg
c3BlY2lmaWMgbWFjaGluZSB0eXBlCj4+IGNhbGxlZCAidm1hcHBsZSIuIEl0IG1pbWlja3MgdGhl
IGRldmljZSBtb2RlbCB0aGF0IEFwcGxlJ3MgcHJvcHJpZXRhcnkKPj4gVmlydHVhbGl6YXRpb24u
RnJhbWV3b3JrIGV4cG9zZXMsIGJ1dCBpbXBsZW1lbnRzIGl0IGluIFFFTVUuCj4+Cj4+IFdpdGgg
dGhpcyBuZXcgbWFjaGluZSB0eXBlLCB5b3UgY2FuIHJ1biBtYWNPUyBndWVzdHMgb24gQXBwbGUg
U2lsaWNvbgo+PiBzeXN0ZW1zIHZpYSBIVkYuIFRvIGRvIHNvLCB5b3UgbmVlZCB0byBmaXJzdCBp
bnN0YWxsIG1hY09TIHVzaW5nCj4+IFZpcnR1YWxpemF0aW9uLkZyYW1ld29yayBvbnRvIGEgdmly
dHVhbCBkaXNrIGltYWdlIHVzaW5nIGEgdG9vbCBsaWtlCj4+IG1hY29zdm0gKGh0dHBzOi8vZ2l0
aHViLmNvbS9zLXUvbWFjb3N2bSkKPj4KPj4gICAkIG1hY29zdm0gLS1kaXNrIGRpc2suaW1nLHNp
emU9MzJnIC0tYXV4IGF1eC5pbWcgXAo+PiAgICAgICAgICAgICAtLXJlc3RvcmUgVW5pdmVyc2Fs
TWFjXzEyLjAuMV8yMUE1NTlfUmVzdG9yZS5pcHN3IHZtLmpzb24KPj4KPj4gVGhlbiwgZXh0cmFj
dCB0aGUgRUNJRCBmcm9tIHRoZSBpbnN0YWxsZWQgVk06Cj4+Cj4+ICAgJCBjYXQgIiRESVIvbWFj
b3N2bS5qc29uIiB8IHB5dGhvbjMgLWMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4+ICAgJ2ltcG9ydCBqc29uLHN5cztvYmo9anNvbi5sb2FkKHN5cy5zdGRpbik7cHJpbnQob2Jq
WyJtYWNoaW5lSWQiXSkgfCAgICBcCj4+ICAgYmFzZTY0IC1kIHwgcGx1dGlsIC1leHRyYWN0IEVD
SUQgcmF3IC0KPiBCZXdhcmUsIHRoYXQgdGhlIGZpbGUgd2lsbCBiZSBjYWxsZWQgJ3ZtLmpzb24n
IGFuZCBESVIgaXMgdW5kZWZpbmVkIGZvbGxvd2luZwo+IHRoZSBwcmV2aW91cyBsaW5lLiBBbHNv
LCBpdCdzIG1pc3NpbmcgYSBzaW5nbGUtcXVvdGUgYXQgdGhlIGVuZCBvZgo+IGBbIm1hY2hpbmVJ
ZCJdKWAuCgoKVGhhbmtzIDopCgoKPgo+PiBJbiBhZGRpdGlvbiwgY3V0IG9mZiB0aGUgZmlyc3Qg
MTZrYiBvZiB0aGUgYXV4LmltZzoKPj4KPj4gICAkIGRkIGlmPWF1eC5pbWcgb2Y9YXV4LmltZy50
cmltbWVkIGJzPSQoKCAweDQwMDAgKSkgc2tpcD0xCj4+Cj4+IE5vdywgeW91IGNhbiBqdXN0IGxh
dW5jaCBRRU1VIHdpdGggdGhlIGJpdHMgZ2VuZXJhdGVkIGFib3ZlOgo+Pgo+PiAgICQgcWVtdS1z
eXN0ZW0tYWFyY2g2NCAtc2VyaWFsIG1vbjpzdGRpbyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+PiAgIC1tIDRHICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiAgIC1NIHZtYXBwbGUsdXVpZD02MjQwMzQ5
NjU2MTY1MTYxNzg5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiAgIC1i
aW9zIC9TeXMqL0xpYiovRnJhKi9WaXJ0dWFsaXphdGlvbi5mKi9SKi9BVlBCb290ZXIudm1hcHBs
ZTIuYmluICAgICAgXAo+PiAgIC1wZmxhc2ggYXV4LmltZy50cmltbWVkICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiAgIC1wZmxhc2ggZGlzay5pbWcg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
PiAgIC1kcml2ZSBmaWxlPWRpc2suaW1nLGlmPW5vbmUsaWQ9cm9vdCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+PiAgIC1kZXZpY2UgdmlydGlvLWJsay1wY2ksZHJpdmU9cm9v
dCx4LWFwcGxlLXR5cGU9MSAgICAgICAgICAgICAgICAgICAgICAgXAo+PiAgIC1kcml2ZSBmaWxl
PWF1eC5pbWcudHJpbW1lZCxpZj1ub25lLGlkPWF1eCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+PiAgIC1kZXZpY2UgdmlydGlvLWJsay1wY2ksZHJpdmU9YXV4LHgtYXBwbGUtdHlwZT0y
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiAgIC1hY2NlbCBodmYgLW5vLXJlYm9vdAo+IEp1
c3QgZm9yIGNsYXJpdHksIEknZCBhZGQgdGhhdCB0aGUgJ3ZtYXBwbGUsdXVpZD0uLi4nIGhhcyB0
byBiZSBzZXQgdG8gdGhlCj4gRUNJRCB0aGUgcHJldmlvdXMgc3RlcC4KPgo+IFlvdSBoYXZlbid0
IGRlZmluZWQgYSBkaXNwbGF5LCBidXQgSSdtIG5vdCBzdXJlIGlmIHRoYXQgaXMgb24gcHVycG9z
ZSB0bwo+IHNob3cgYSBtaW5pbWFsIHNldHVwLiBJIGhhZCB0byBhZGQgJy1kaXNwbGF5IHNkbCcg
Zm9yIGl0IHRvIGZ1bGx5IHdvcmsuCgoKV2VpcmQsIEkgZG8gZ2V0IGEgbm9ybWFsIGNvY29hIG91
dHB1dCBzY3JlZW4gYnkgZGVmYXVsdC4KCgo+Cj4+IFRoZXJlIGFyZSBhIGZldyBsaW1pdGF0aW9u
cyB3aXRoIHRoaXMgaW1wbGVtZW50YXRpb246Cj4+Cj4+ICAgLSBPbmx5IHJ1bnMgb24gbWFjT1Mg
YmVjYXVzZSBpdCByZWxpZXMgb24KPj4gICAgIFBhcmF2aXJ0dWFsaXplc0dyYXBoaWNzLkZyYW1l
d29yawo+PiAgIC0gU29tZXRoaW5nIGlzIG5vdCBmdWxseSBjb3JyZWN0IG9uIGludGVycnVwdCBk
ZWxpdmVyeSBvcgo+PiAgICAgc2ltaWxhciAtIHRoZSBrZXlib2FyZCBkb2VzIG5vdCB3b3JrCj4+
ICAgLSBObyBSb3NldHRhIGluIHRoZSBndWVzdCBiZWNhdXNlIHdlIGxhY2sgdGhlIHByaXZhdGUK
Pj4gICAgIGVudGl0bGVtZW50IHRvIGVuYWJsZSBUU08KPiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0
byBtaXRpZ2F0ZSB0aGUga2V5Ym9hcmQgaXNzdWUgdXNpbmcgYW4gZW11bGF0ZWQgVVNCCj4ga2V5
Ym9hcmQ/IEkgdHJpZWQgcG9raW5nIGFyb3VuZCB3aXRoIGl0LCBidXQgd2l0aCBubyBzdWNjZXNz
LgoKClVuZm9ydHVuYXRlbHkgSSB3YXMgbm90IGFibGUgdG8gZ2V0IFVTQiBzdGFibGUgaW5zaWRl
IHRoZSBndWVzdC4gVGhpcyAKbWF5IGJlIGFuIGlzc3VlIHdpdGggaW50ZXJydXB0IHByb3BhZ2F0
aW9uOiBXaXRoIHVzYi1rYmQgSSBzZWUgbWFjT1Mgbm90IApwaWNrIHVwIGtleSB1cCBvciBkb3du
IGV2ZW50cyBpbiB0aW1lLgoKCkFsZXgKCgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdl
cm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5n
OiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBKb25hdGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRz
Z2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVz
dC1JRDogREUgMjg5IDIzNyA4NzkKCgo=


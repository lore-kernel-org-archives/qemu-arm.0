Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2254134njb;
        Mon, 21 Oct 2024 02:48:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWml7n6Vzjn4dMZdyxerC8Q3IK5506/33n627oje4z5WvSsYpxQZ7EyO+vLxntLrSur6rEzIKC+qoRLyA==@linaro.org
X-Google-Smtp-Source: AGHT+IGbhgQ9beft9X2lFR7dpAji8fQ0LqBr6FcLc3TPV0xLwZsbuu2qb9dqdCTfet1H9n13+7lC
X-Received: by 2002:ac8:7d96:0:b0:457:c74a:638e with SMTP id d75a77b69052e-460aeddbb83mr156405861cf.38.1729504117583;
        Mon, 21 Oct 2024 02:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729504117; cv=none;
        d=google.com; s=arc-20240605;
        b=Zc1ipIBqCEueLo4z02rlcPV2qbZq7BhhivXRlLJQza+aaF7HwIMl9aqIa0vwsuzC1W
         o0wVISLMzyA5JgpjK8XVY7q2SaiAI7MlSz5dg72K6+hNwgRhkBllvF4/Tg1Rii23dbOd
         cKoAKELXejAFDzUjyqYYzSkpd4IbHb9m2CdUFkMPd7WEz5hqMZdILKiY4s50cu/ZOxEV
         /v2Wr8658WeKuQxmBkA2eNPkXIP2FmhFpyf+I4zhKU/+14BlzYkoDkdBqcBHh+Cz9rfY
         MguhMdexXbwYVI3FU34V2IcIgeg7OPYlWMgG+DSUVJomT3Uev3G4DGW8sYq43phKGlwP
         uNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=XV5lWyMc696jfF8fpjQ/ePQGJbmEV+PHJMd2WAZYGxg=;
        fh=enERk/guNwFBp4NxiJo/atwFhUYaebntg+vmhkuuamA=;
        b=MWz3zcImEHuPVAWGcKS5mZ+jLNHb5aRt06tBGMvQdrTvfXhAxACb7Kv22LIxk1qnbB
         VcEPLJViNT05HO9G79YX0CiDViBneVoSgThVYmodm5wGW4Qc86vSjGaF+g5MWvUA1NqZ
         19oCS4Zv6kBzDPp0rkJeXt/IngToy5MSkcSfpLTCK1zlPCTiaA7wJVPAosINB24kUpvT
         v7RObSHCJr0tcmrw6oGz0W3ARYPC0kgvgSyx7YPYcqnf35qdMetGbr5tAJ7rm/pwhi+m
         EpHn8LSsUT5w4otjTe1c3gKQIgbwvHTvBEPjwapiIqiZzjRcZBx+70wEGjXbqe8qytLN
         V90g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N6KXFH1R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3da0898si36119011cf.695.2024.10.21.02.48.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 02:48:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N6KXFH1R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2p1E-00009f-H6; Mon, 21 Oct 2024 05:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1t2p15-000092-Ps
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 05:48:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1t2p14-0004Tf-4o
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 05:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729504077;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XV5lWyMc696jfF8fpjQ/ePQGJbmEV+PHJMd2WAZYGxg=;
 b=N6KXFH1Rd3D1dkg6O70vG0RHZD/REj6cSa17+cmnzctACEOIayNHgPVJgsIFZgjBxsNdy/
 T3qdM3mX/5KEfGCg8//M9CEM95napHjVDM9z8/Azfp4i0c1yDseszK7CxsGsf0ek4vPQzN
 O9z2PLypQOwVm1za4mf3nTqnr4DVS2A=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-324-gtjl8h9-PkiNCvMv7SqlTg-1; Mon,
 21 Oct 2024 05:47:53 -0400
X-MC-Unique: gtjl8h9-PkiNCvMv7SqlTg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0A63419560B1; Mon, 21 Oct 2024 09:47:46 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.27])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4C1BB1956089; Mon, 21 Oct 2024 09:47:38 +0000 (UTC)
Date: Mon, 21 Oct 2024 10:47:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] tests/functional: Convert most Aspeed machine tests
Message-ID: <ZxYjN6T2T9Dqnpz8@redhat.com>
References: <20241018071726.2723934-1-clg@redhat.com>
 <f1249e0b-290e-4416-a776-3f5d6ada1ece@redhat.com>
 <341dff70-d0bc-432b-8764-8cb9b1aba1eb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <341dff70-d0bc-432b-8764-8cb9b1aba1eb@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.527,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qHvZhBPICgTA

On Mon, Oct 21, 2024 at 11:31:03AM +0200, Cédric Le Goater wrote:
> Hello Thomas,
> 
> 
> On 10/21/24 10:53, Thomas Huth wrote:
> > On 18/10/2024 09.17, Cédric Le Goater wrote:
> > > This is a simple conversion of the tests with some cleanups and
> > > adjustments to match the new test framework. Replace the zephyr image
> > > MD5 hashes with SHA256 hashes while at it.
> > > 
> > > The SDK tests depend on a ssh class from avocado.utils which is
> > > difficult to replace. To be addressed separately.
> > > 
> > > Signed-off-by: Cédric Le Goater <clg@redhat.com>
> > > ---
> > 
> >   Hi Cédric,
> > 
> > I'm seeing errors when I try to run "make check-functional" with this patch multiple times, e.g.:
> > 
> >    File "/home/thuth/devel/qemu/tests/functional/test_arm_aspeed.py", line 111, in test_arm_ast2400_palmetto_openbmc_v2_9_0
> >      image_path = self.ASSET_PALMETTO_FLASH.fetch()
> >                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >    File "/home/thuth/devel/qemu/tests/functional/qemu_test/asset.py", line 104, in fetch
> >      raise Exception("Asset cache is invalid and downloads disabled")
> > Exception: Asset cache is invalid and downloads disabled
> > 
> > Could it be that the tests alter the file in the download cache?
> 
> yes. the flash image is updated by Linux. I don't reproduce the issue
> on my build though. Are you using special options ?

NB, this would only happen if invoked via 'make check-functional' as
that has the logic to run asset downloads seprately from the tests.
If you were just directly invoking the test program you wouldn't see
this error message, as it'll just re-download.

You would have to run the test twice too I guess, first time downloads
and modifies the image, second time sees the modified image and
complains.



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


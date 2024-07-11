Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp233895nji;
        Thu, 11 Jul 2024 07:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4PLRp2BB/OOgedha3HWLRanf2OR1DhnqB/XimaU5FFrG1wiwlHLqDWHad6uW0nTHmQWaoP+P/OeggintPcdOEOuAZoWLn
X-Google-Smtp-Source: AGHT+IGx9rBe45axFulSaWghokdToOAUT78ufM8Q53t5bb0SS/zfswN577ZfxVCqGmn2xu8w/BNU
X-Received: by 2002:a05:6808:189b:b0:3d9:2b15:65d4 with SMTP id 5614622812f47-3d93c01937bmr9863933b6e.21.1720709876477;
        Thu, 11 Jul 2024 07:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720709876; cv=none;
        d=google.com; s=arc-20160816;
        b=plxtW5YHIK3sqN/LMRozGZZLxsycS2iR1VnzdU7aAnWe9cfo9UWenBbC4/e9euQNPB
         Xb/ppVHiSPyRdykbdfGWW1wDsAVyKBTPGFkx5SVnfozPOzlO2shFUaPXF1FUJYSNcdqO
         L09xhxpuWp3Dtofd6I+TYU1cFyebq7f75q63HbZFTPSlyBV/TK/0JqIZ2fDjnwS1A9vu
         qxdKFI1eFcaqNsmk69P/ZXlyBSY4GamPhlOsMolN+e1OwKPWIc+EABtFvQ4LUoljzpUE
         cXwtSsCInQ2jJONM8P7FBk3LKAmF++psMI1ThqaUp5Wev4lVw20twDUapEtbQAMoGnIF
         FRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=pSNyp73GmX9Gq/1KPcyC9EzhdSEJsuAvEbc9Y4aVRLw=;
        fh=PZZZFV8j2RgGIbzskhtWdlvVXy5heg72ZUGrrsWXK1w=;
        b=j694xr58BcvdLMAgJhrNKohh5d+5aEc9ODVi51Z/89QLj1IgtlKIO+jE2tSdtwoR9D
         sWYOhtRGjIFCzfBDSgpXZLe8+KhrvvqdaG2Gj7IHLjA5LMP8OeDubTEvhaSdd4UXlJmI
         bzHtf+Z0hCvXZ5/PTmtMEL6Fs2TcRu87/OvsCniQpSjQZ3nZPsTJRGwRF8F52jx7Wsw+
         osnE1TrJIHdwgXkDqAZgh4YdaaJ6Wk3Y5KybCGh7Q6Ihpi1RrOITWU9CXLQgq/j5b05s
         MQuWSbEH2zOMK3XayjCF+2+R5752yVhS0HzR3DjLdS6s8xpOO60YiNvJX9e9hs29pJBJ
         E5qg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QjF/1C/c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f1909f2a0si809128685a.251.2024.07.11.07.57.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2024 07:57:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QjF/1C/c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRvEI-0005tn-6V; Thu, 11 Jul 2024 10:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sRvEG-0005sb-T4
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 10:57:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sRvEE-0003L0-U1
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 10:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720709821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pSNyp73GmX9Gq/1KPcyC9EzhdSEJsuAvEbc9Y4aVRLw=;
 b=QjF/1C/cdLZ/H6B6zTscN8GGxsXHu5b7YCYLueZpecBWt+LTy8ilbv1hEat7XlNdFDTFod
 G363ZZ8HllLKjxZByCF2xxjNwHSGOsO47KKrf+BXdnEHjkDkM13RP1DUeEvJ++jvEzREuD
 /c99k8rUOBZrR6x4TdGW/Qgl8cKWV0Q=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-V338vvhWPuiaZd3dvjNilw-1; Thu, 11 Jul 2024 10:56:59 -0400
X-MC-Unique: V338vvhWPuiaZd3dvjNilw-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-44aeacbf2baso418411cf.2
 for <qemu-arm@nongnu.org>; Thu, 11 Jul 2024 07:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720709819; x=1721314619;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pSNyp73GmX9Gq/1KPcyC9EzhdSEJsuAvEbc9Y4aVRLw=;
 b=YeHUFwlZe6Z7FOAJuxcr2EYiIzKjcPQQ9IIXaIy/Y5hZRqm6kSZmUP5oKVfahZq4E0
 FSddu09Z9p9phhONcG6Fzn2MFVDrupXaTm8XxXrXWTd62t2P/TJ79wrsW50AOvBl4s6c
 0fH2vgjvEP6pLZPOdQKkB6rtGnW2IF61F8VagysWPXbu4vO1jIlzZO5BawTOGXdKUaO6
 RKrZNJFFNOIjpOOwRRSPKUKyCcNt7rKZBeXgZM2YPAqHQgbNAitLykuG9m2NBBUEDFV+
 mhb9DzTbvvqH2wG+oLoc62z0+DqAN0lPUyCWLBRLY2zkZ//cPz+YYBlRB8TuAFYSrKW3
 BIgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqpPxeynMI9kDLlbR+ls2TVuLpYCC+rj0G0Y4yk1kmFLr+MbhzRIgcFnDagBRZ+7K9ubBWPL7QE+OmNzYcWLrNHB5g
X-Gm-Message-State: AOJu0YwwAjr4tZZF1U2xavlSgypfBdbXJ66vRUgnnh101c5JcM0kUXmQ
 yAdjsDEunXOaXakaH6t3eMa7NkN1XcuM9voIPKIGOXxWjCSXmrDa/dymvBzea3dWOpY/Qgg7TBF
 pT1p0mmErJYVnS/kGW0BkHAxESRSD+eppw8mkjoCaS9rIFwuqgA==
X-Received: by 2002:a05:620a:458e:b0:79e:fc9c:4bc2 with SMTP id
 af79cd13be357-7a1471c8a6bmr357065085a.4.1720709818945; 
 Thu, 11 Jul 2024 07:56:58 -0700 (PDT)
X-Received: by 2002:a05:620a:458e:b0:79e:fc9c:4bc2 with SMTP id
 af79cd13be357-7a1471c8a6bmr357063185a.4.1720709818621; 
 Thu, 11 Jul 2024 07:56:58 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79f19028ab0sm298959685a.64.2024.07.11.07.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 07:56:58 -0700 (PDT)
Date: Thu, 11 Jul 2024 10:56:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, Bin Meng <bmeng.cn@gmail.com>,
 Hao Wu <wuhaotsh@google.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, devel@lists.libvirt.org,
 Luc Michel <luc.michel@amd.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>
Subject: Re: [PATCH v3 06/17] hw/sd/sdcard: Do not store vendor data on block
 drive (CMD56)
Message-ID: <Zo_yuMfEmg0W1msP@x1n>
References: <Zo6iZjc8YpI1_9dW@x1n> <874j8xfc9s.fsf@suse.de>
 <Zo7dcF8OKfH92RlR@x1n> <871q41f2pk.fsf@suse.de>
 <Zo7rCXtap2lWd4IB@x1n> <87ttgxdj1p.fsf@suse.de>
 <Zo8F4Gq4f7SawaDc@x1n> <87plrkdpd7.fsf@suse.de>
 <Zo_n39Vusyy-O_48@x1n> <87h6cwdm4n.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <87h6cwdm4n.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KA0EbN0TRy7U

On Thu, Jul 11, 2024 at 11:44:08AM -0300, Fabiano Rosas wrote:
> But of course, that means we cannot claim to support all kinds of
> forward migrations anymore. Only those in the 6 year period.

That "6 years" comes from machine type deprecation period, and migration
compatibility is mostly only attached to machine types, and we only ever
allowed migration with the same machine type.

It means, >6 years migration will never work anyway as soon as we start to
deprecate machine types (irrelevant of any reuse of UNUSED), because the >6
years machine types will simply be gone.. See configuration_post_load(),
where it'll throw an error upfront when machine type mismatched.

-- 
Peter Xu


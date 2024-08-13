Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp145067njf;
        Tue, 13 Aug 2024 07:21:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7y6ZWhp9NAueCRDCvp2B+U1kjWBR9+2iJDhmJotYK+fwnwd1G8Z7rtvclRlllYUInCWIhvSniyhcBnKaUQ5uVfm+7Z9Os
X-Google-Smtp-Source: AGHT+IGJfpzzMo+q3dJjmPlk8Gx5kj3z9xF/sgrVVe4gqg2BvEOkMhyDp++NuOucYnK5s8ZMVYc1
X-Received: by 2002:a05:6358:720f:b0:1ab:f2b3:f018 with SMTP id e5c5f4694b2df-1b19d2492a4mr427010355d.0.1723558861096;
        Tue, 13 Aug 2024 07:21:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723558861; cv=none;
        d=google.com; s=arc-20160816;
        b=rK2Y4vGqaGgCP6vGCaWXcxscChB56i/L9qAKkPi3QRnsDOlMXiI+QE1wWpVsSRhWE/
         42BSZz2HiBR4TEAJ4hgzYPkP8Sw44GWPa36QSQTPlEAvenZNDGwuBiKID4EePGBtm3E3
         GZMqV365OFLKzX2VkMI+e50Hr9x38ERSzCkGPrzg/Y3Qhlo54myPKlWh7hphKpvVWUQE
         3QQkMolEVeB2NO3fShrpdZBVx36RJP6MlCRSk9pShtC4bzUvuTU8Uvs6dUkzCoZpDvlW
         gsHGqdsZxrtoM+6ldyltfGgnui5SWAw+NYyhC5d4eqti9JW3AhmLOcz2rnKn8idJHhGh
         z5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=CRYX8b16a4JPih5uUSREPJrhPNRMzaz9YiqhpUbewx8=;
        fh=WdSpsz/T2mVsermW9xvm6vkyKChAVka9qKLRerAUpcc=;
        b=DbR5C3v0lfa+0DXDuBqA0gDqusW2RsPXgF7YX4ek9L09xJegMeT8kl3KL4xir3aACQ
         qNFgv0Ft4NCo6hdjLlz+MmzQ4IptPBL42375FgmK4ie+0iT2SV7gj8RbclbprrSkom2b
         nl9s+zRRthIxu+QMVv8hipdAOAXBW7YRw5IuECNGIf/NgbA9GJyH+1I7Gun1ufs/XBSz
         ds6CodwcLD5HoHGuLfK+gqozA1nzBX2nF45MqnVbHAMvAaM65a3LdzX/8lQk50GpbywH
         RT60SiLNSEhPA0OMHn4niSc9JsisWpQR34Y2kFDYqYoUeTyj0oyuZ57Db++kil/6GEB9
         qx/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NE4L8L+s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-841366cefbasi1160395241.46.2024.08.13.07.21.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2024 07:21:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NE4L8L+s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sdsON-00028C-Rv; Tue, 13 Aug 2024 10:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sdsOG-00026e-Ha
 for qemu-arm@nongnu.org; Tue, 13 Aug 2024 10:20:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sdsO6-00046F-6q
 for qemu-arm@nongnu.org; Tue, 13 Aug 2024 10:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723558835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CRYX8b16a4JPih5uUSREPJrhPNRMzaz9YiqhpUbewx8=;
 b=NE4L8L+sYwyOQJr2f9/oCtXS9RFw6KptHRXvXHL/dnbnYBTmtngeyXTREpPE/0lmEGDJB+
 XliWbX/MvcP+8Lt0Ag1DonKN0vPcCUVGfR13oPDeVlerOslgqc0vixMZyPedPuNgecYXjy
 iRf1xApqfNT06fITYNx09Y7lDVinxmc=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-z3ZN0GjMP6mgSE6f2cEdsA-1; Tue, 13 Aug 2024 10:20:33 -0400
X-MC-Unique: z3ZN0GjMP6mgSE6f2cEdsA-1
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-5d5d0d392dfso1092421eaf.0
 for <qemu-arm@nongnu.org>; Tue, 13 Aug 2024 07:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723558833; x=1724163633;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CRYX8b16a4JPih5uUSREPJrhPNRMzaz9YiqhpUbewx8=;
 b=syLmFCuJ2NGXw0ohbOfhWS/XgHa9fgW2Hw4o3tGbayYK0CzA7Ifn1VD/b8Zquwzae/
 xEgjcPg+UNKMGbB/HUnvhaeBzhag/NEuToWGExl+C/brsKX8kVK2r8KRXtcV/DyJzEeg
 EX05vSDHrDbd+wzKUfIkzOok/TaxZNMlQNpbOqJUPFEFvwNGRtHn7h56dMuDA8LejDA5
 92lUr4S5dhUKvUM1kX3fAM/aBJvlIrCOv/an5IeN1WmpdTSDKvh3z7cwSTeMtqHnnyyL
 HkNQ2zbtj59rTpqHxjCiCxcimK2pYndxqCobxiR28JdoJqqjZ/unrw0p9F63qitcV4/d
 NaXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs55P1gCFOtCnOcmLdsJvBWdAgy2GP64Aywv5jP0WivbFEzJO2y00ZBK8c99u1AKSux3SGm2K3oTqLyImMb77DXrdN
X-Gm-Message-State: AOJu0YyzpKlmnbbA6XjddsPfdhV2rrpFJY2NINxV64kXmlNIUoytFXfz
 LtC+TqwONUL2PUDY3ulz2HCcAxOLs7NwwFwqfJfR1pfMukpTAVY+TJVTPCu5Gtl5IAH0JfjVbqZ
 xjKmGndjZGOvU6VSON4MqL8VP+bWlJ7obLUWM0STg6EffcRBSdw==
X-Received: by 2002:a4a:db64:0:b0:5c7:b587:40a7 with SMTP id
 006d021491bc7-5da6e58012cmr1432780eaf.1.1723558832864; 
 Tue, 13 Aug 2024 07:20:32 -0700 (PDT)
X-Received: by 2002:a4a:db64:0:b0:5c7:b587:40a7 with SMTP id
 006d021491bc7-5da6e58012cmr1432758eaf.1.1723558832575; 
 Tue, 13 Aug 2024 07:20:32 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bd82cac7cfsm34403586d6.74.2024.08.13.07.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 07:20:31 -0700 (PDT)
Date: Tue, 13 Aug 2024 10:20:29 -0400
From: Peter Xu <peterx@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Fabiano Rosas <farosas@suse.de>, Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH-for-9.1] docs: Fix some typos (found by typos) and
 grammar issues
Message-ID: <ZrtrrUIGNIXPGJOC@x1n>
References: <20240813125638.395461-1-sw@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <20240813125638.395461-1-sw@weilnetz.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: riwrPmfcQJtI

On Tue, Aug 13, 2024 at 02:56:38PM +0200, Stefan Weil via wrote:
> Fix the misspellings of "overriden" also in code comments.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


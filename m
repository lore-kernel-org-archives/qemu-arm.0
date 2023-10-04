Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2844000ejb;
        Wed, 4 Oct 2023 11:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrbDjPnbEpkfO9AhfUwftHhFx3JAf3d71xy9FjkgK33jSohP8Ky08ZJdhohKvXPhZtJfrU
X-Received: by 2002:a05:620a:4048:b0:775:cf5e:a66d with SMTP id i8-20020a05620a404800b00775cf5ea66dmr2322621qko.24.1696443408511;
        Wed, 04 Oct 2023 11:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696443408; cv=none;
        d=google.com; s=arc-20160816;
        b=s8vADYLwYFeQzyoUU8WsRO43FlcGg0UlV4nxTICWeGatVW6Y1S1ioQwevF+gm9Y4t7
         F2cbWfFGct9TNnx5zXHkg7C2Y/ajcbqRPySp4Q5JQQqlFlRTOPaI9BuAdcI3XcYxKO9X
         W1UAYNuQe4Oo6HYIbrkWDpF15Jl9IR9KqNfpw9VpOXzZW66I+UhP8/6tj6uJGAbd+ewZ
         Xy9I36xHvin5w1ZEQEk3lqZGqjbyFgdNHvFoxC6BAGRY49MfLUbWbMUoFKkstyUGVOlQ
         H46zUCqyl1YYUTF/PESU9xYUO5hprF6Emqb/upVSaDwSiL95Vk3keIKBZVuL7vltpqFC
         33MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=L3vfV70nt6Z476QmDhBufxf1KpaFQSxr161KBGLmeVY=;
        fh=3ZOVCvJSiw0miLA2ffmJyhfKbHQcGAscFX+5YjS3UkA=;
        b=rvMu66+I/e9zitd87l9BB1wJys8le/FKBoyirmOz9HNv98cjojat5k7nZMS06lgfAu
         UWnn5ta8N4XJ4aV+uaMI/NetiGy9oWGVEDCMMlkRsQ9gkdby1sx4muhaydbNmyx/spTP
         gSQhmgnpm4g68uoLqfqz4MhW+X9s5NOzTAGolaFpX6sGQIPEN2kStyQ6Ds85AECobIHg
         CHNAQ+FcIyJZs00qErMjOE6Q5Bsi7wgRsHFThquXz4WLTECcqO8iFZF5rI23crjsdLXk
         2P9rIp6+bJR3dxyjjYhlzjcBxx5I9vPvLmosMCYhGysri6vpv6iRTes1TRG3C7zgt6aS
         fERA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KINXqS4Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w30-20020a05620a0e9e00b00773bb585660si1708791qkm.348.2023.10.04.11.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 11:16:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KINXqS4Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo6Pq-0007J7-OV; Wed, 04 Oct 2023 14:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qo6PV-00070S-Fr
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 14:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qo6PT-0007wi-8d
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 14:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696443345;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3vfV70nt6Z476QmDhBufxf1KpaFQSxr161KBGLmeVY=;
 b=KINXqS4Y/e19jHubqIu+L1DJCSEgbZ30ZNQMjXNn1nWnORn7a2BQmvh6ooEoquiQ17Z/kG
 jMHHjOp4tOdIkHv0Po2nDrVUYJf0yPZyrRspTK/tEKtTORuhx1uErHyQiqLJRLHI1wsC3f
 OuJbmziVz0urGW3b7fBLUVO25Jdti7E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-EX6PIrsmNq6xCmvzmjFRFA-1; Wed, 04 Oct 2023 14:15:44 -0400
X-MC-Unique: EX6PIrsmNq6xCmvzmjFRFA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-32320b9d671so123428f8f.3
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 11:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696443343; x=1697048143;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L3vfV70nt6Z476QmDhBufxf1KpaFQSxr161KBGLmeVY=;
 b=T169+zuz78aBgmRsaZzeQoks5hduJUDvjH1UAt6rHkuj/11siXt4MRGzGtpPD57omz
 LUpi4C1+Oz7XGfldbz7Qxa5TNbnpjoc7YDfEEGuIeMR18meOL2WXduXquzDFm6A75dLC
 FxvobyHbfibnXfYE9U2ubruN2FLnUbrPfOzpwMWwtIDPkmwQRLR8thWzeN7it3HhFBV0
 RDSxF9pZEmCOS262QJdnMxoRa8ly0T6lXx7tm54GSSk/I/mxbEdpN2u9lKFZZZQP14+B
 CDpfEG2gih1MWFV5Ma4X6eVdDFWQ/ypMoX+CVxTyFuMujeT3FfYJhZGMWtAIczJvAufo
 p98w==
X-Gm-Message-State: AOJu0Yw6boLFjkmJrt3KsKIkIc0PSSaD1wx8rctAHvZ2spH9w4mIk65E
 BrEq5D1fH8sayrZfkwpNkdueAKG2rx6GRJE4olJe2D3y1iwgZlPn1bi+q4+Sz3tN2Ofwhc3buOC
 Em7KLXj4or+0f
X-Received: by 2002:adf:d4cb:0:b0:31f:d95d:20a6 with SMTP id
 w11-20020adfd4cb000000b0031fd95d20a6mr2789028wrk.12.1696443342917; 
 Wed, 04 Oct 2023 11:15:42 -0700 (PDT)
X-Received: by 2002:adf:d4cb:0:b0:31f:d95d:20a6 with SMTP id
 w11-20020adfd4cb000000b0031fd95d20a6mr2789012wrk.12.1696443342583; 
 Wed, 04 Oct 2023 11:15:42 -0700 (PDT)
Received: from redhat.com (static-151-150-85-188.ipcom.comunitel.net.
 [188.85.150.151]) by smtp.gmail.com with ESMTPSA id
 j16-20020a056000125000b00326f5d0ce0asm4536916wrx.21.2023.10.04.11.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 11:15:41 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,  Peter Xu <peterx@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>
Subject: Re: [PATCH 14/21] qapi: Inline and remove QERR_MIGRATION_ACTIVE
 definition
In-Reply-To: <20231004173158.42591-15-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 4 Oct 2023 19:31:49
 +0200")
References: <20231004173158.42591-1-philmd@linaro.org>
 <20231004173158.42591-15-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Date: Wed, 04 Oct 2023 20:15:41 +0200
Message-ID: <87sf6qqmnm.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: k449G5egkoQX

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> Address the comment added in commit 4629ed1e98
> ("qerror: Finally unused, clean up"), from 2015:
>
>   /*
>    * These macros will go away, please don't use
>    * in new code, and do not add new ones!
>    */
>
> Mechanical transformation using sed, manually
> removing the definition in include/qapi/qmp/qerror.h.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


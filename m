Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E0BC54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:17:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojYi-0006Vo-38; Tue, 28 Jul 2026 11:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wojYe-0006Uh-0N
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:17:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wojYb-00076t-9h
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785251844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g+tDN3w34gUKvNXaae/hUChCIlCuGo8BxHp7+kLgqqA=;
 b=b47azSBUlFFmcbBxTgC6+7oHPJjUi/8CIy8niPycozHBAVoiogT+RdssU24XGN4h6BWXsS
 xYVoJ8FXO9agkrYicksakH5jG9vZpEh+AzKWiIO/7yhNMgCXUVbLgIA7gYmsxRyPLLuQDH
 NLH0iW1fH6TxVdes+mAghkZ2AX3fdzg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-s8NoKE2eNzmzH04LG6JfOw-1; Tue, 28 Jul 2026 11:17:22 -0400
X-MC-Unique: s8NoKE2eNzmzH04LG6JfOw-1
X-Mimecast-MFC-AGG-ID: s8NoKE2eNzmzH04LG6JfOw_1785251842
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-697d51ced1cso4217506a12.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785251841; x=1785856641;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=g+tDN3w34gUKvNXaae/hUChCIlCuGo8BxHp7+kLgqqA=;
 b=TJ9UxTq7t5If7lMg6qsmahoPTaIPUtIWWnLK2RXW70yJKnpCbfnT9OGnVSqW9iuTtm
 cKwEYPhXqMPfTEb3j4YfRQAkobYU7bhwmOkCGZXdlSbmQLRWuCfiDdovSnuyJIa1hzpj
 U1J0sowUT+FHBpd0ILGiZ7rAH7XAgbkBwjwozBtP3QOYQIEJFGdsA+uNq2GpuL3uLtyB
 /guaAS7y50JfOUkR4z6iTwqzyiKytJiEyjqpTfWc31T8OWBt/AFRSXPYw3OqNsMQaAc6
 Um30IKsqNMyGa2ZP8/n2k38QvUv/Eeu9FuvzsmUdZ042I+LswAMzH4UOKOIFizvQJ9lx
 l2FQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqc3vjgelONfkOE+TtR3ElfKU3+TwXehtLXWXoHbyeafgBhGY6XzRnNyaCZoyjq4fOkcWqEVF1a3Q==@nongnu.org
X-Gm-Message-State: AOJu0Yz0Bfn++/4US5EzsVgfr48HYRd2DBIXBNNdFovkLBMwhwuB5AD9
 AVDjRfMIk0KpF33oE53JXozrq2J8+m39w+aawsDuYdkolHeXfKLw1ENV77hBFaSyV+vAfVjKKvF
 UcIgTBShs3rX+JzQirzHMa6Qt1sWGsRbOouWiTPgm2/dyv9wi/bxpXA==
X-Gm-Gg: AR+sD10pRBqauhM6KpJ41khC9G4deKUXp14P7E8UHYEpCG/7eVLvCND/wtWKd0eVG0O
 CwfrfvGzzC0cmaD2Er/ibMzoIbT1oQ68ea9cKMzou9ykBF6DzBq4R/CnCtm8HVlZNHatwWx8sEd
 CK1iZ7yFuPA0HgZyD+3nG22zIgwnAy6flfNLVKefk3hg+nVLA9MpQ/PMm+juS4LxYnbsywELbSJ
 3L9zj+Bu0kRU4CPY+o/mPj5NV3IAf3792ah/0y2ZmhENyFjqkr0GiIaaa1iO7I0ULsyXp4a3XZk
 bxGDLXg4r2VzGBGvmYEQFb0Gizc007u9O0pMWOu6V39jTG5VPoX3RhVQ+sCgOYkq8o3y
X-Received: by 2002:a05:6402:4551:b0:698:5610:76e5 with SMTP id
 4fb4d7f45d1cf-6a0349eaa8bmr1199536a12.6.1785251841590; 
 Tue, 28 Jul 2026 08:17:21 -0700 (PDT)
X-Received: by 2002:a05:6402:4551:b0:698:5610:76e5 with SMTP id
 4fb4d7f45d1cf-6a0349eaa8bmr1199503a12.6.1785251841074; 
 Tue, 28 Jul 2026 08:17:21 -0700 (PDT)
Received: from x1.local ([174.91.117.74]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69fb59468dbsm4332873a12.28.2026.07.28.08.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 08:17:20 -0700 (PDT)
Date: Tue, 28 Jul 2026 11:17:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 richard.henderson@linaro.org, alex@shazbot.org, berrange@redhat.com,
 philmd@mailo.com, david@kernel.org, clg@redhat.com,
 pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v4 2/3] system/memory: Use qemu_ram_move() for directly
 accessible regions
Message-ID: <amjH8uXODb-r-_FF@x1.local>
References: <20260727032649.145381-1-gshan@redhat.com>
 <20260727032649.145381-3-gshan@redhat.com>
 <CAFEAcA9_tDRAd97z4UtNhFPK+fMbq37LJhWTSmD5cueo61hvvg@mail.gmail.com>
 <0a384d67-fc56-4a21-9d0e-25f218a45228@redhat.com>
 <CAFEAcA9HbTSj9cJfv8o=jYSuPhScr-RVKWCos4kpUJ+T1S6g5Q@mail.gmail.com>
 <13333e56-3725-4550-849c-9035f6925213@oss.qualcomm.com>
 <CAFEAcA9X7SNUvQpwXA2_xReUERB-eBETty3g32-PD=MVk536sg@mail.gmail.com>
 <2322668a-20a3-4a6b-8d7f-c04ddfef84f1@redhat.com>
 <ami94CmeBNRKy_es@x1.local>
 <CAFEAcA-y+vNK2u-rSq+SVjNZrhO2=BsUysEw2PtCdCZ=qYx2bw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-y+vNK2u-rSq+SVjNZrhO2=BsUysEw2PtCdCZ=qYx2bw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CnAivMQJtKttD-vn2_FKhk8xrPnv_vxIn1i9yxd4WWU_1785251842
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.58,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Jul 28, 2026 at 03:38:53PM +0100, Peter Maydell wrote:
> On Tue, 28 Jul 2026 at 15:34, Peter Xu <peterx@redhat.com> wrote:
> > I think the bit ops should be more efficient. I plan to queue v5 with a
> > fixup, v5 here:
> >
> > https://lore.kernel.org/qemu-devel/20260728031731.286666-1-gshan@redhat.com/
> >
> > Fixup:
> >
> > diff --git a/system/physmem.c b/system/physmem.c
> > index fbe7df2391..2f37cbeb07 100644
> > --- a/system/physmem.c
> > +++ b/system/physmem.c
> > @@ -3162,13 +3162,18 @@ void qemu_ram_move(void *dst, const void *src, size_t n)
> >  {
> >      uintptr_t test, len;
> >
> > -    if (src == dst || n == 0) {
> > +    if (n == 0) {
> >          return;
> >      }
> 
> As we're dropping the src==dst check here, we also need to drop
> the "and the memory areas do not overlap" clause from the
> documentation comment.
> 
> Otherwise I'm happy with the v5 with that fixup applied,
> and you can apply my Reviewed-by: tag.

Will do, thanks.

-- 
Peter Xu



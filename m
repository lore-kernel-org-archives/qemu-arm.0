Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1679145njc;
        Thu, 22 May 2025 00:31:54 -0700 (PDT)
X-Received: by 2002:a05:6402:8d4:b0:601:e0cf:9dc with SMTP id 4fb4d7f45d1cf-601e0cf0c73mr9520866a12.29.1747899113855;
        Thu, 22 May 2025 00:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747899113; cv=none;
        d=google.com; s=arc-20240605;
        b=Nym0bx9AK93MvUx1RVogz8YLw6YjQrMtAV50AikgA1d6lOGrnkWRoA3wsWSKfAdiGZ
         pdMjoWTXfwGmQFvbtOW3BNdoiEtNmTEsggUz63orgOAmSTEWyOPzaWSUuK0CwNV2BrVS
         /nKcwkMcsbE7ccSr7Yq9WnX29kn/3Vnb3S2yRBtDQxn/0DP0SuB3vKZSkFnrpYxdQCB7
         kq6clUVOf8bxrzcrR6z4JI9CqS/Gi+86m4LPE87ZkSlPPjkMP19sZ749HM/y0OjFCFTR
         RsGfwL6KXZ95IENgG0cx+eFaxAK/7lVNZTOWSm/uHGtbzj5WKCsYplkl64Zrx2Fi6vaT
         CL+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gf+h8kkA/3Jln/k6fX0GvPl69knnfjdIaTO1nziewp4=;
        fh=/pKOFtPC5njTEwlXZe2Ho/vQPNOFtPE8bZG6t2qRONw=;
        b=Rc3RA3vlmHjU3ZaBnvRIxFcWhlXe0+MmPZBUSPjPXx4nZp5NutCu/FAGlv1/1Cij8m
         hvuATM8A/qqU+aL5zVx2NWAEQ7kPSonb6IudYRdHb+5VZpsvgky0IKf81/Db/ajlzS22
         UPrT7RTwNDc56mAzUUHmM8x1ITvGVmbOyzGz3HpY55UiyYMqYtUn/VRL7eGgosrW1dgM
         gvIN7Hw9jgoItXMpKjI9f75O5zpGQ27FLvJIiMkvBaj9d2Gy6VndVdWOz4g6g/lYJ/nL
         //X9wB/2qc7Fbo/2ZyJIbxq8eFAjYOJPG0FZ4iJNnEdKYzeLf2DdNWK+eH+X1Ti/SOrk
         9jmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KPLyQ4qD;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-602364622afsor1366226a12.10.2025.05.22.00.31.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 22 May 2025 00:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KPLyQ4qD;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747899113; x=1748503913; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gf+h8kkA/3Jln/k6fX0GvPl69knnfjdIaTO1nziewp4=;
        b=KPLyQ4qDYfskybCv5oJf69VAMvQMm3PDJY6LTaUiE1v9tK4ASGs9yMWRKf0hHu5grZ
         sZMq7YD9JPBX4ndnGF4s+sJzbDqmZuGnOa60/811+qweXp0knsKnhLs0HCLEuO4N2/gA
         U99nCvFiiwQJozl+l/p7SOsNg1U8A5bgj8WOlt9yUqX9hKyeKzeCPFTCPU3q+Fa0fmV9
         bvVTS7aLDt1kKJWp8lNzUKq2YFjVDWgDHjpHB7SbBXfTXeRKzZSkUs2wkL2H1i4tfuZ9
         09elWsszQ6AFKMTs0NZYbWhSmOtBsr82CTZCwR6tKnz+53SVbNb+fmgJR0okoLGhtDF8
         ghzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747899113; x=1748503913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gf+h8kkA/3Jln/k6fX0GvPl69knnfjdIaTO1nziewp4=;
        b=MPpQsp4KEHcenA94B3IVr6p9y0+AwoD2eSCWveKgUJOP/M0fAZfE2LUjsrLMLI48IH
         SB0dJc7Tc1dXIiix8rL29AKdAA513AT7vyA/fGGpVUEpyqPFSnPLLoM7XXyg/8i7RqSp
         t7LiW1EDLqkFviOOaJyMfUWpkWcuEz2xhPUw44TmLMUf+DJyZU9CqnBvnm45ijtUmP+i
         VxuNGRMwOknTvl+NZLx5yyBjglUb7/MDLj+opnRdFNs3eysNWfIyBsXpfyqFf260E8tM
         K8ONEHhC8jbPI4ZdGqAkyYBc3mXMwRz8CRorNH21faRvbq1cksqvtuLfOjU27d9TG97B
         j0Cg==
X-Gm-Message-State: AOJu0Yw+gp9DfM+gRWoK92c/icZcu2u5kbxOV94VgSOo2gBRoYIrkhof
	uY2uh65WxxC117F2mooL8mT5MjTF67vXd2FqceaNvXoE5YYt2cV8Be8XhOUOWtrUq/+AQd4NzDa
	lkr75D7HrTnxKnDxWuEw2xoptTG/o6GZAFlrmT8q6w1by
X-Gm-Gg: ASbGncsM3svuToAaeLiKKUEYBEQvaK0Nr2oeynJK1HD7FD1xbljL2WSO6qhExfJOLJH
	TUk9a5a7Vz4tcQLKBnV1Rg/4INJ/AdTvRQGoitU4b06aMC4S2pHvvVjMN9B42lQOlsnwG412wrB
	JaV5//o/91ecvI+MGS9quV2YTiKJ0G8TwCqnheaQ==
X-Google-Smtp-Source: AGHT+IHiLNIG2oooJW+e/fLeZMXvUUKawGwy9sq6Y/SjyHYujJc5uO0C/CFAz5lSiTr5HVFQJDhNm+npFy7KNpE71P8=
X-Received: by 2002:a05:6402:2810:b0:5fd:ef5d:cfc4 with SMTP id
 4fb4d7f45d1cf-60119ce9672mr19729243a12.32.1747899113224; Thu, 22 May 2025
 00:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-13-alex.bennee@linaro.org> <4d300cca-3ac2-4072-a35c-0b6aef970b26@daynix.com>
 <87bjrl87p5.fsf@draig.linaro.org> <83945c43-bfb2-4469-90bd-e3a7c2ca5d89@daynix.com>
In-Reply-To: <83945c43-bfb2-4469-90bd-e3a7c2ca5d89@daynix.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 22 May 2025 10:31:26 +0300
X-Gm-Features: AX0GCFvWlyfqpBhjjS_JMNQlBSITFb3sCng89Y2w8AMfyAcq17mJGXV34At8igQ
Message-ID: <CAAjaMXZ8acKBSGHvcQOcOnzBDCjFU1SOjse7pHtHWxNeREc2gg@mail.gmail.com>
Subject: Re: [PATCH v3 12/20] virtio-gpu: fix hang under TCG when unmapping blob
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>, 
	Fabiano Rosas <farosas@suse.de>, Peter Xu <peterx@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Gustavo Romero <gustavo.romero@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: LiPIb5TJtaxl

On Thu, May 22, 2025 at 10:03=E2=80=AFAM Akihiko Odaki <akihiko.odaki@dayni=
x.com> wrote:
>
> On 2025/05/22 15:45, Alex Benn=C3=A9e wrote:
> > Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> >
> >> On 2025/05/22 1:42, Alex Benn=C3=A9e wrote:
> >>> From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> >>> This commit fixes an indefinite hang when using VIRTIO GPU blob
> >>> objects
> >>> under TCG in certain conditions.
> >>> The VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB VIRTIO command creates a
> >>> MemoryRegion and attaches it to an offset on a PCI BAR of the
> >>> VirtIOGPUdevice. The VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB command unmap=
s
> >>> it.
> >>> Because virglrenderer commands are not thread-safe they are only
> >>> called on the main context and QEMU performs the cleanup in three ste=
ps
> >>> to prevent a use-after-free scenario where the guest can access the
> >>> region after it=E2=80=99s unmapped:
> >>> 1. From the main context, the region=E2=80=99s field finish_unmapping=
 is
> >>> false
> >>>      by default, so it sets a variable cmd_suspended, increases the
> >>>      renderer_blocked variable, deletes the blob subregion, and unpar=
ents
> >>>      the blob subregion causing its reference count to decrement.
> >>> 2. From an RCU context, the MemoryView gets freed, the FlatView gets
> >>>      recalculated, the free callback of the blob region
> >>>      virtio_gpu_virgl_hostmem_region_free is called which sets the
> >>>      region=E2=80=99s field finish_unmapping to true, allowing the ma=
in thread
> >>>      context to finish replying to the command
> >>> 3. From the main context, the command is processed again, but this
> >>> time
> >>>      finish_unmapping is true, so virgl_renderer_resource_unmap can b=
e
> >>>      called and a response is sent to the guest.
> >>> It happens so that under TCG, if the guest has no timers configured
> >>> (and
> >>> thus no interrupt will cause the CPU to exit), the RCU thread does no=
t
> >>> have enough time to grab the locks and recalculate the FlatView.
> >>> That=E2=80=99s not a big problem in practice since most guests will a=
ssume a
> >>> response will happen later in time and go on to do different things,
> >>> potentially triggering interrupts and allowing the RCU context to run=
.
> >>> If the guest waits for the unmap command to complete though, it block=
s
> >>> indefinitely. Attaching to the QEMU monitor and force quitting the gu=
est
> >>> allows the cleanup to continue.
> >>> There's no reason why the FlatView recalculation can't occur right
> >>> away
> >>> when we delete the blob subregion, however. It does not, because when=
 we
> >>> create the subregion we set the object as its own parent:
> >>>       memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
> >>> The extra reference is what prevents freeing the memory region
> >>> object in
> >>> the memory transaction of deleting the subregion.
> >>> This commit changes the owner object to the device, which removes
> >>> the
> >>> extra owner reference in the memory region and causes the MR to be
> >>> freed right away in the main context.
> >>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> >>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> >>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >>> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >>> Message-Id: <20250410122643.1747913-3-manos.pitsidianakis@linaro.org>
> >>> Cc: qemu-stable@nongnu.org
> >>> ---
> >>>    hw/display/virtio-gpu-virgl.c | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>> diff --git a/hw/display/virtio-gpu-virgl.c
> >>> b/hw/display/virtio-gpu-virgl.c
> >>> index 71a7500de9..8fbe4e70cc 100644
> >>> --- a/hw/display/virtio-gpu-virgl.c
> >>> +++ b/hw/display/virtio-gpu-virgl.c
> >>> @@ -112,7 +112,7 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
> >>>        vmr->g =3D g;
> >>>        mr =3D g_new0(MemoryRegion, 1);
> >>>    -    memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size,
> >>> data);
> >>> +    memory_region_init_ram_ptr(mr, OBJECT(g), "blob", size, data);
> >>>        memory_region_add_subregion(&b->hostmem, offset, mr);
> >>>        memory_region_set_enabled(mr, true);
> >>>
> >>
> >> I suggest dropping this patch for now due to the reason I pointed out
> >> for the first version of this series.
> >
> > This fixes an actual bug - without it we get a hang.
> >
>
> I understand that but it also introduces a regression; "[PATCH v3 14/20]
> ui/gtk-gl-area: Remove extra draw call in refresh" is also a similar case=
.
>
> Ideally such a bug should be fixed without regression, but I understand
> it is sometimes difficult to do that and postponing the bug resolution
> until figuring out the correct way does not make sense.
>
> In such a case, a bug should be fixed minimizing the regression and the
> documentation of the regression should be left in the code.
>
> In particular, this patch can cause use-after-free whether TCG is used
> or not. Instead, I suggest to avoid freeing memory regions at all on
> TCG. It will surely leak memory, but won't result in use-after-free at
> least and the other accelerators will be unaffected.
>
> Regards,
> Akihiko Odaki

We tested this fix with ASAN and didn't see anything. Do you have a
test case in mind that can reproduce this use-after-free? It'd help
make a certain decision on whether to drop this patch or not. I'm not
doubting that this can cause a use-after-free by the way, it's just
that it is hypothetical only. If it causes a use-after-free for sure
we should definitely drop it.

> Instead, I suggest to avoid freeing memory regions at all on
> TCG. It will surely leak memory, but won't result in use-after-free at
> least and the other accelerators will be unaffected.

Leaking memory for blob objects is also not ideal, since they are
frequently allocated. It's memory-safe but the leak can accumulate
over time.

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

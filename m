Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp148859njf;
        Thu, 29 Aug 2024 23:43:51 -0700 (PDT)
X-Received: by 2002:a17:906:fd42:b0:a86:85eb:bdd4 with SMTP id a640c23a62f3a-a89a36a2d63mr49262066b.38.1725000231458;
        Thu, 29 Aug 2024 23:43:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725000231; cv=none;
        d=google.com; s=arc-20160816;
        b=kKyQ5KLnSYque+FVmWmNBxn1Fk1eHViJLnljbvCkXI5ufC+MVmaKuBxwIA/y8zYC0P
         5VAy4/xjfw41Ud3NxZkezFyuyQTT8z/Ao9dJLgNfDWiCvPaRLr8U1e7ROKjn3raGRziY
         s0Q7fhiCjccW5vwC49tRHmJLf9qsrUqEPnpbZcUWSDmXO6i0lYEdmbhiUTkzjy6G4J++
         t0zrOuMGbyNy3j2/wEX+bx0l900+5WfNz5aAW8Gv8n45xzt3+A2RtjYahfw27HszLx/w
         FVRCBMVcACG7RtSX0jB2bx+coFXE21p9RlPYZZA2mzS7QLRVPFBLq6AY8m9y73ano2Od
         9L9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rGoDqIKDra4SHAZMcKmuE8kq3KSl6lBGnAg2BCVAt30=;
        fh=WVhCYe9ghrAl6cMXkTezevwCEujLzfLGJ8rL5GTZbMw=;
        b=Pkc1M4OgNNDJ5uoALHGIlqq1FtiniSZ1W1qGD2df/AXQwrCr2FZPfwpmFkXi6BqM4x
         pmR31wsHFTWsnTmPIQKeGbGPGZa+rvUZ+p26kySkig7aEia+mU0lVAo4C2oJ5mk9IEV5
         idm6aDGwjI3T8tNWFoFG4MflJxv5u8QJD7+oraX7b37kEh0nNFhX/cVWpkdl7WgewNto
         QmQ3fBvi6TEcPkBJVIg+yHeBeaFq/HvHBuB6Y3gZKUJnTSl3i8cEfj2Tykw8VwPv5JOX
         Z3w+jSbzPMVSweOi95Wi2tOvbW9z7B5Um65eSGm+14BJgw/NPNhdz0qIes2/T25DU089
         J4Wg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n+z0r8A2;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a898912f100sor90686766b.16.2024.08.29.23.43.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 29 Aug 2024 23:43:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n+z0r8A2;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725000231; x=1725605031; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rGoDqIKDra4SHAZMcKmuE8kq3KSl6lBGnAg2BCVAt30=;
        b=n+z0r8A2UGaVaxMfU5TmwI8JrOJUs9JqUnuK4MQ/yIErv9EJD3mBTvqIRnNVhWhIIA
         ZQbEsg7x99QRNgvfE9bnUOhozKjhdGUQfkP7nQzlCzmB8vcweyUZOmSeyItR7DbcOGhp
         dpUbUzaI4FuEn+NoTIf3WxG39j23jYlbRBDtqGDf5PqiGh9JhYyZXuvzcKG5bvP34BNx
         ZY4fuSIdjG0LOAJgnqMEsFbe86arl/oAcbZf5hVLaDmdW8a/wK0wQ/cLpvRTEw2QLsaL
         XL5uUifD+JqxneAm3FAclJrAa9PXq20pT6C1CDs4//iGrUTSFrIIYr0JRyCSVopr5+0m
         GZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725000231; x=1725605031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGoDqIKDra4SHAZMcKmuE8kq3KSl6lBGnAg2BCVAt30=;
        b=iBPTITHCvgiG8kV9LggzJv4N24ZV1vlCI8Hr+3Jkiwz0wq1WgQkWZmIs05c65wLUJv
         YoahG+NGXnt5LwHHD4IfDyIaBJ2PalK8Ivtu5EnqF/0doYgHCDtRiBJjuTrgQk41mpQy
         jt6plWl7P0nHAajR6qRG45jVLGK96l0Gx25tCsGxGgreU9xZvTg9N+Vv2ts/537jJs1l
         Tu/HP1xLKJI1bBo/Y5gdiBPJfVFd5BrXHurUkaUq/bt7IRZRWHlyOPutY+z+yV4TaZ5U
         GiUCKMnDwo6TAZ76nFgdhqeSGH2uqSNKH/PlVIbvNMNytggaqxCqZ7/4aMVHskAXPzRI
         iGaw==
X-Gm-Message-State: AOJu0Yy8YLkbiypo55s5rHADIksnHLgoZc4SK3UeU/NFEmWVwaRQXGeu
	CNXbioKkgCM7XbUFx7V1Cpy5umzDzIClGwjVoDKyjdt4fEEQD0I5EmXwVPUvUOvxMM0w2m1+iQw
	O/K67mhq5JMwfELOZqAWNhXRRY+DgrPej640DMSav0V2g8lkiqgE=
X-Google-Smtp-Source: AGHT+IHD9nzqIIpu2eIhkaOhKBS93IuP4kSb6/phG8kC6RWTOOaYQ7iat2V9Ym/lTXPyvLEXylZy1ehaugNkCX226gc=
X-Received: by 2002:a05:6402:35d6:b0:5c0:a8b1:ca8a with SMTP id
 4fb4d7f45d1cf-5c21ed42ac9mr3888946a12.11.1725000230260; Thu, 29 Aug 2024
 23:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240828-rust-pl011-v9-0-35579191f17c@linaro.org>
 <20240828-rust-pl011-v9-7-35579191f17c@linaro.org> <871q284wxk.fsf@draig.linaro.org>
 <dd2ed180-3624-4981-adb7-c78e699048a7@intel.com>
In-Reply-To: <dd2ed180-3624-4981-adb7-c78e699048a7@intel.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 30 Aug 2024 09:43:38 +0300
Message-ID: <CAAjaMXZhvq3qppgEhs5zB-M=hfDFNT993XCUp0ZKPFmVxFXL2Q@mail.gmail.com>
Subject: Re: [PATCH RESEND v9 7/9] rust: add crate to expose bindings and interfaces
To: Junjie Mao <junjie.mao@intel.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"open list:ARM SMMU <qemu-arm@nongnu.org>," <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>
Content-Type: multipart/alternative; boundary="000000000000f669bb0620e0e98f"
X-TUID: 2zzv5kmJdy+U

--000000000000f669bb0620e0e98f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=F0=9F=8E=B1

On Fri, 30 Aug 2024, 04:19 Junjie Mao, <junjie.mao@intel.com> wrote:

> On 8/28/2024 9:08 PM, Alex Benn=C3=A9e wrote:
> > Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:
> >
> >> Add rust/qemu-api, which exposes rust-bindgen generated FFI bindings a=
nd
> >> provides some declaration macros for symbols visible to the rest of
> >> QEMU.
> >
> > As mentioned on IRC I'm hitting a compilation error that bisects to thi=
s
> > commit:
> >
> >    [148/1010] Generating bindings for Rust rustmod-bindgen-rust_wrapper=
.h
> >    FAILED: bindings.rs
> >    /home/alex/.cargo/bin/bindgen ../../rust/wrapper.h --output
> /home/alex/lsrc/qemu.git/builds/rust/bindings.rs --disable-header-comment
> --raw-line '// @generated' --ctypes-prefix core::ffi --formatter rustfmt
> --generate-block --generate-cstr --impl-debug --merge-extern-blocks
> --no-doc-comments --use-core --with-derive-default --allowlist-file
> '/home/alex/lsrc/qemu.git/include/.*' --allowlist-file
> '/home/alex/lsrc/qemu.git/.*' --allowlist-file
> '/home/alex/lsrc/qemu.git/builds/rust/.*' -- -I/home/alex/lsrc/qemu.git/.
> -I/home/alex/lsrc/qemu.git/builds/rust/. -I/home/alex/lsrc/qemu.git/inclu=
de
> -I/home/alex/lsrc/qemu.git/builds/rust/include -I/usr/include/capstone
> -I/usr/include/p11-kit-1 -I/usr/include/pixman-1 -I/usr/include/libpng16
> -I/usr/include/spice-server -I/usr/include/spice-1 -I/usr/include/spice-1
> -DSTRUCT_IOVEC_DEFINED -I/usr/include/libusb-1.0 -I/usr/include/SDL2
> -D_REENTRANT -I/usr/include/glib-2.0
> -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread
> -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/gio-unix-2.0
> -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
> -pthread -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/slir=
p
> -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
> -DNCURSES_WIDECHAR=3D1 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=3D600
> -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
> -I/usr/include/gtk-3.0 -I/usr/include/pango-1.0 -I/usr/include/glib-2.0
> -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/harfbuzz
> -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libmount
> -I/usr/include/blkid -I/usr/include/fribidi -I/usr/include/cairo
> -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0
> -I/usr/include/x86_64-linux-gnu -I/usr/include/gio-unix-2.0
> -I/usr/include/atk-1.0 -I/usr/include/at-spi2-atk/2.0
> -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0
> -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -pthread
> -I/usr/include/gtk-3.0 -I/usr/include/pango-1.0 -I/usr/include/glib-2.0
> -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/harfbuzz
> -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libmount
> -I/usr/include/blkid -I/usr/include/fribidi -I/usr/include/cairo
> -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0
> -I/usr/include/x86_64-linux-gnu -I/usr/include/gio-unix-2.0
> -I/usr/include/atk-1.0 -I/usr/include/at-spi2-atk/2.0
> -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0
> -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -pthread
> -I/usr/include/vte-2.91 -I/usr/include/glib-2.0
> -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/libmount
> -I/usr/include/blkid -I/usr/include/pango-1.0 -I/usr/include/harfbuzz
> -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/fribidi
> -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gtk-3.0
> -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/x86_64-linux-gnu
> -I/usr/include/gio-unix-2.0 -I/usr/include/atk-1.0
> -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0
> -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include
> -pthread -I/usr/include/glib-2.0
> -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/spice-server
> -I/usr/include/spice-1 -I/usr/include/cacard -I/usr/include/glib-2.0
> -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/nss
> -I/usr/include/nspr -I/usr/include/PCSC -pthread -D_REENTRANT
> -I/usr/include/pipewire-0.3 -I/usr/include/spa-0.2 -D_REENTRANT
> -I/usr/include/p11-kit-1 -I/usr/include/fuse3
> -I/usr/include/x86_64-linux-gnu -D_FILE_OFFSET_BITS=3D64
> -D__USE_FILE_OFFSET64 -D__USE_LARGEFILE64 -DUSE_POSIX_ACLS=3D1
> -I/usr/include/uuid -I/usr/include/glib-2.0
> -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/p11-kit-1
> -I/usr/include/p11-kit-1 -I/usr/include/p11-kit-1 -I/usr/include/p11-kit-=
1
> -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE
> -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
> -std=3Dgnu11 -MD -MQ ../../rust/wrapper.h -MF wrapper.h.d
> >    /usr/include/liburing.h:296:3: error: use of undeclared identifier
> 'memory_order_release'
> >    /usr/include/liburing.h:1080:11: error: use of undeclared identifier
> 'memory_order_acquire'
> >    /usr/include/liburing.h:1116:9: error: use of undeclared identifier
> 'memory_order_acquire'
> >    /usr/include/liburing.h:1125:9: error: use of undeclared identifier
> 'memory_order_relaxed'
> >    /usr/include/liburing.h:1161:2: error: use of undeclared identifier
> 'memory_order_relaxed'
> >    /usr/include/liburing.h:1197:19: error: use of undeclared identifier
> 'memory_order_acquire'
> >    /usr/include/liburing.h:1267:10: error: use of undeclared identifier
> 'memory_order_relaxed'
> >    /usr/include/liburing.h:1269:10: error: use of undeclared identifier
> 'memory_order_acquire'
> >    /usr/include/liburing.h:1320:2: error: use of undeclared identifier
> 'memory_order_release'
> >    panicked at
> /home/alex/.cargo/registry/src/index.crates.io-6f17d22bba15001f/bindgen-c=
li-0.69.4/main.rs:52
> :36:
> >    Unable to generate bindings:
> ClangDiagnostic("/usr/include/liburing.h:296:3: error: use of undeclared
> identifier 'memory_order_release'\n/usr/include/liburing.h:1080:11: error=
:
> use of undeclared identifier
> 'memory_order_acquire'\n/usr/include/liburing.h:1116:9: error: use of
> undeclared identifier
> 'memory_order_acquire'\n/usr/include/liburing.h:1125:9: error: use of
> undeclared identifier
> 'memory_order_relaxed'\n/usr/include/liburing.h:1161:2: error: use of
> undeclared identifier
> 'memory_order_relaxed'\n/usr/include/liburing.h:1197:19: error: use of
> undeclared identifier
> 'memory_order_acquire'\n/usr/include/liburing.h:1267:10: error: use of
> undeclared identifier
> 'memory_order_relaxed'\n/usr/include/liburing.h:1269:10: error: use of
> undeclared identifier
> 'memory_order_acquire'\n/usr/include/liburing.h:1320:2: error: use of
> undeclared identifier 'memory_order_release'\n")
>
> Those missing identifiers should have been defined in stdatomic.h which i=
s
> part
> of C11. You can check if that header exists under the default header
> search
> paths (which is listed by clang -E -Wp,-v -) and whether that file
> declares
> those enum constants. If so, you can further check whether there is any
> stdatomic.h elsewhere that shadows the standard one.
>

Indeed. These are in the compiler's own header files. I had problems on
Debian when using clang-14 and clang-15 but I got rid of them after I
upgraded to newer versions. If anyone can confirm/reproduce this we can add
a meson warning check?


>
> > And I wasn't able to force the newer clang with:
> >
> >    env CLANG_PATH=3D/usr/bin/clang-15 ../../configure '--disable-docs'
> --target-list=3Daarch64-softmmu --enable-rust
> >
> > So if clang is required for bindgen we at least need:
> >
> >    - to probe for clang (separately from --cc)
> >    - allow the user to override the default
> >    - pass the clang we want to use somehow to bindgen
> >
> > Briefly looking at the bindgen code I see:
> >
> >    fn main() {
> >        let out_dir =3D PathBuf::from(env::var("OUT_DIR").unwrap());
> >
> >        let mut dst =3D
> >
> File::create(Path::new(&out_dir).join("host-target.txt")).unwrap();
> >        dst.write_all(env::var("TARGET").unwrap().as_bytes())
> >            .unwrap();
> >
> >        // On behalf of clang_sys, rebuild ourselves if important
> configuration
> >        // variables change, to ensure that bindings get rebuilt if the
> >        // underlying libclang changes.
> >        println!("cargo:rerun-if-env-changed=3DLLVM_CONFIG_PATH");
> >        println!("cargo:rerun-if-env-changed=3DLIBCLANG_PATH");
> >        println!("cargo:rerun-if-env-changed=3DLIBCLANG_STATIC_PATH");
> >        println!("cargo:rerun-if-env-changed=3DBINDGEN_EXTRA_CLANG_ARGS"=
);
> >        println!(
> >            "cargo:rerun-if-env-changed=3DBINDGEN_EXTRA_CLANG_ARGS_{}",
> >            std::env::var("TARGET").unwrap()
> >        );
> >        println!(
> >            "cargo:rerun-if-env-changed=3DBINDGEN_EXTRA_CLANG_ARGS_{}",
> >            std::env::var("TARGET").unwrap().replace('-', "_")
> >        );
> >    }
>
> This is build.rs which is a build script invoked by cargo. The entry of
> the
> bindgen executable is in the bindgen-cli crate.
>
> ---
> Best Regards
> Junjie Mao
>
> >
> > So I wonder if this depends on what libclang versions can be found when
> > cargo builds it? Although if it does it must do so dynamically:
> >
> >    $ ldd /home/alex/.cargo/bin/bindgen
> >            linux-vdso.so.1 (0x00007f7cb43d8000)
> >            libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.so.1
> (0x00007f7cb438c000)
> >            libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6
> (0x00007f7cb42ad000)
> >            libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6
> (0x00007f7cb3a1f000)
> >            /lib64/ld-linux-x86-64.so.2 (0x00007f7cb43da000)
> >
>

--000000000000f669bb0620e0e98f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>=F0=9F=8E=B1<br><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, 30 Aug 2024, 04:19 Junjie Mao, &lt=
;<a href=3D"mailto:junjie.mao@intel.com">junjie.mao@intel.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 8/28/2024 9=
:08 PM, Alex Benn=C3=A9e wrote:<br>
&gt; Manos Pitsidianakis &lt;<a href=3D"mailto:manos.pitsidianakis@linaro.o=
rg" target=3D"_blank" rel=3D"noreferrer">manos.pitsidianakis@linaro.org</a>=
&gt; writes:<br>
&gt; <br>
&gt;&gt; Add rust/qemu-api, which exposes rust-bindgen generated FFI bindin=
gs and<br>
&gt;&gt; provides some declaration macros for symbols visible to the rest o=
f<br>
&gt;&gt; QEMU.<br>
&gt; <br>
&gt; As mentioned on IRC I&#39;m hitting a compilation error that bisects t=
o this<br>
&gt; commit:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 [148/1010] Generating bindings for Rust rustmod-bindgen-r=
ust_wrapper.h<br>
&gt;=C2=A0 =C2=A0 FAILED: <a href=3D"http://bindings.rs" rel=3D"noreferrer =
noreferrer" target=3D"_blank">bindings.rs</a><br>
&gt;=C2=A0 =C2=A0 /home/alex/.cargo/bin/bindgen ../../rust/wrapper.h --outp=
ut /home/alex/lsrc/qemu.git/builds/rust/<a href=3D"http://bindings.rs" rel=
=3D"noreferrer noreferrer" target=3D"_blank">bindings.rs</a> --disable-head=
er-comment --raw-line &#39;// @generated&#39; --ctypes-prefix core::ffi --f=
ormatter rustfmt --generate-block --generate-cstr --impl-debug --merge-exte=
rn-blocks --no-doc-comments --use-core --with-derive-default --allowlist-fi=
le &#39;/home/alex/lsrc/qemu.git/include/.*&#39; --allowlist-file &#39;/hom=
e/alex/lsrc/qemu.git/.*&#39; --allowlist-file &#39;/home/alex/lsrc/qemu.git=
/builds/rust/.*&#39; -- -I/home/alex/lsrc/qemu.git/. -I/home/alex/lsrc/qemu=
.git/builds/rust/. -I/home/alex/lsrc/qemu.git/include -I/home/alex/lsrc/qem=
u.git/builds/rust/include -I/usr/include/capstone -I/usr/include/p11-kit-1 =
-I/usr/include/pixman-1 -I/usr/include/libpng16 -I/usr/include/spice-server=
 -I/usr/include/spice-1 -I/usr/include/spice-1 -DSTRUCT_IOVEC_DEFINED -I/us=
r/include/libusb-1.0 -I/usr/include/SDL2 -D_REENTRANT -I/usr/include/glib-2=
.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/lib=
mount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/include/glib-=
2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/li=
bmount -I/usr/include/blkid -I/usr/include/slirp -I/usr/include/glib-2.0 -I=
/usr/lib/x86_64-linux-gnu/glib-2.0/include -DNCURSES_WIDECHAR=3D1 -D_DEFAUL=
T_SOURCE -D_XOPEN_SOURCE=3D600 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-li=
nux-gnu/glib-2.0/include -I/usr/include/gtk-3.0 -I/usr/include/pango-1.0 -I=
/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/i=
nclude/harfbuzz -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/inc=
lude/libmount -I/usr/include/blkid -I/usr/include/fribidi -I/usr/include/ca=
iro -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/x8=
6_64-linux-gnu -I/usr/include/gio-unix-2.0 -I/usr/include/atk-1.0 -I/usr/in=
clude/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/=
usr/lib/x86_64-linux-gnu/dbus-1.0/include -pthread -I/usr/include/gtk-3.0 -=
I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu=
/glib-2.0/include -I/usr/include/harfbuzz -I/usr/include/freetype2 -I/usr/i=
nclude/libpng16 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include=
/fribidi -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pi=
xbuf-2.0 -I/usr/include/x86_64-linux-gnu -I/usr/include/gio-unix-2.0 -I/usr=
/include/atk-1.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -=
I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -pthrea=
d -I/usr/include/vte-2.91 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-g=
nu/glib-2.0/include -I/usr/include/libmount -I/usr/include/blkid -I/usr/inc=
lude/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/freetype2 -I/usr/incl=
ude/libpng16 -I/usr/include/fribidi -I/usr/include/cairo -I/usr/include/pix=
man-1 -I/usr/include/gtk-3.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/x=
86_64-linux-gnu -I/usr/include/gio-unix-2.0 -I/usr/include/atk-1.0 -I/usr/i=
nclude/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I=
/usr/lib/x86_64-linux-gnu/dbus-1.0/include -pthread -I/usr/include/glib-2.0=
 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/spice-server -=
I/usr/include/spice-1 -I/usr/include/cacard -I/usr/include/glib-2.0 -I/usr/=
lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/nss -I/usr/include/nsp=
r -I/usr/include/PCSC -pthread -D_REENTRANT -I/usr/include/pipewire-0.3 -I/=
usr/include/spa-0.2 -D_REENTRANT -I/usr/include/p11-kit-1 -I/usr/include/fu=
se3 -I/usr/include/x86_64-linux-gnu -D_FILE_OFFSET_BITS=3D64 -D__USE_FILE_O=
FFSET64 -D__USE_LARGEFILE64 -DUSE_POSIX_ACLS=3D1 -I/usr/include/uuid -I/usr=
/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/inclu=
de/p11-kit-1 -I/usr/include/p11-kit-1 -I/usr/include/p11-kit-1 -I/usr/inclu=
de/p11-kit-1 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -I/=
usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -std=3Dgn=
u11 -MD -MQ ../../rust/wrapper.h -MF wrapper.h.d<br>
&gt;=C2=A0 =C2=A0 /usr/include/liburing.h:296:3: error: use of undeclared i=
dentifier &#39;memory_order_release&#39;<br>
&gt;=C2=A0 =C2=A0 /usr/include/liburing.h:1080:11: error: use of undeclared=
 identifier &#39;memory_order_acquire&#39;<br>
&gt;=C2=A0 =C2=A0 /usr/include/liburing.h:1116:9: error: use of undeclared =
identifier &#39;memory_order_acquire&#39;<br>
&gt;=C2=A0 =C2=A0 /usr/include/liburing.h:1125:9: error: use of undeclared =
identifier &#39;memory_order_relaxed&#39;<br>
&gt;=C2=A0 =C2=A0 /usr/include/liburing.h:1161:2: error: use of undeclared =
identifier &#39;memory_order_relaxed&#39;<br>
&gt;=C2=A0 =C2=A0 /usr/include/liburing.h:1197:19: error: use of undeclared=
 identifier &#39;memory_order_acquire&#39;<br>
&gt;=C2=A0 =C2=A0 /usr/include/liburing.h:1267:10: error: use of undeclared=
 identifier &#39;memory_order_relaxed&#39;<br>
&gt;=C2=A0 =C2=A0 /usr/include/liburing.h:1269:10: error: use of undeclared=
 identifier &#39;memory_order_acquire&#39;<br>
&gt;=C2=A0 =C2=A0 /usr/include/liburing.h:1320:2: error: use of undeclared =
identifier &#39;memory_order_release&#39;<br>
&gt;=C2=A0 =C2=A0 panicked at /home/alex/.cargo/registry/src/index.crates.i=
o-6f17d22bba15001f/bindgen-cli-0.69.4/main.rs:52:36:<br>
&gt;=C2=A0 =C2=A0 Unable to generate bindings: ClangDiagnostic(&quot;/usr/i=
nclude/liburing.h:296:3: error: use of undeclared identifier &#39;memory_or=
der_release&#39;\n/usr/include/liburing.h:1080:11: error: use of undeclared=
 identifier &#39;memory_order_acquire&#39;\n/usr/include/liburing.h:1116:9:=
 error: use of undeclared identifier &#39;memory_order_acquire&#39;\n/usr/i=
nclude/liburing.h:1125:9: error: use of undeclared identifier &#39;memory_o=
rder_relaxed&#39;\n/usr/include/liburing.h:1161:2: error: use of undeclared=
 identifier &#39;memory_order_relaxed&#39;\n/usr/include/liburing.h:1197:19=
: error: use of undeclared identifier &#39;memory_order_acquire&#39;\n/usr/=
include/liburing.h:1267:10: error: use of undeclared identifier &#39;memory=
_order_relaxed&#39;\n/usr/include/liburing.h:1269:10: error: use of undecla=
red identifier &#39;memory_order_acquire&#39;\n/usr/include/liburing.h:1320=
:2: error: use of undeclared identifier &#39;memory_order_release&#39;\n&qu=
ot;)<br>
<br>
Those missing identifiers should have been defined in stdatomic.h which is =
part <br>
of C11. You can check if that header exists under the default header search=
 <br>
paths (which is listed by clang -E -Wp,-v -) and whether that file declares=
 <br>
those enum constants. If so, you can further check whether there is any <br=
>
stdatomic.h elsewhere that shadows the standard one.<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Indeed. These are in th=
e compiler&#39;s own header files. I had problems on Debian when using clan=
g-14 and clang-15 but I got rid of them after I upgraded to newer versions.=
 If anyone can confirm/reproduce this we can add a meson warning check?</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
&gt; <br>
&gt; And I wasn&#39;t able to force the newer clang with:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 env CLANG_PATH=3D/usr/bin/clang-15 ../../configure &#39;-=
-disable-docs&#39; --target-list=3Daarch64-softmmu --enable-rust<br>
&gt; <br>
&gt; So if clang is required for bindgen we at least need:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - to probe for clang (separately from --cc)<br>
&gt;=C2=A0 =C2=A0 - allow the user to override the default<br>
&gt;=C2=A0 =C2=A0 - pass the clang we want to use somehow to bindgen<br>
&gt; <br>
&gt; Briefly looking at the bindgen code I see:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 fn main() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 let out_dir =3D PathBuf::from(env::var(&quo=
t;OUT_DIR&quot;).unwrap());<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut dst =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 File::create(Path::new(&amp;o=
ut_dir).join(&quot;host-target.txt&quot;)).unwrap();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 dst.write_all(env::var(&quot;TARGET&quot;).=
unwrap().as_bytes())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .unwrap();<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 // On behalf of clang_sys, rebuild ourselve=
s if important configuration<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 // variables change, to ensure that binding=
s get rebuilt if the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 // underlying libclang changes.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&quot;cargo:rerun-if-env-changed=
=3DLLVM_CONFIG_PATH&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&quot;cargo:rerun-if-env-changed=
=3DLIBCLANG_PATH&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&quot;cargo:rerun-if-env-changed=
=3DLIBCLANG_STATIC_PATH&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&quot;cargo:rerun-if-env-changed=
=3DBINDGEN_EXTRA_CLANG_ARGS&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cargo:rerun-if-env-chan=
ged=3DBINDGEN_EXTRA_CLANG_ARGS_{}&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 std::env::var(&quot;TARGET&qu=
ot;).unwrap()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cargo:rerun-if-env-chan=
ged=3DBINDGEN_EXTRA_CLANG_ARGS_{}&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 std::env::var(&quot;TARGET&qu=
ot;).unwrap().replace(&#39;-&#39;, &quot;_&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 }<br>
<br>
This is <a href=3D"http://build.rs" rel=3D"noreferrer noreferrer" target=3D=
"_blank">build.rs</a> which is a build script invoked by cargo. The entry o=
f the <br>
bindgen executable is in the bindgen-cli crate.<br>
<br>
---<br>
Best Regards<br>
Junjie Mao<br>
<br>
&gt; <br>
&gt; So I wonder if this depends on what libclang versions can be found whe=
n<br>
&gt; cargo builds it? Although if it does it must do so dynamically:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 $ ldd /home/alex/.cargo/bin/bindgen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux-vdso.so.1 (0x00007f7cb4=
3d8000)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libgcc_s.so.1 =3D&gt; /lib/x8=
6_64-linux-gnu/libgcc_s.so.1 (0x00007f7cb438c000)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libm.so.6 =3D&gt; /lib/x86_64=
-linux-gnu/libm.so.6 (0x00007f7cb42ad000)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc.so.6 =3D&gt; /lib/x86_64=
-linux-gnu/libc.so.6 (0x00007f7cb3a1f000)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib64/ld-linux-x86-64.so.2 (=
0x00007f7cb43da000)<br>
&gt; <br>
</blockquote></div></div></div>

--000000000000f669bb0620e0e98f--
